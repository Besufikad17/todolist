import 'package:flutter/material.dart';
import 'package:todolist/components/button.dart';

class Todo extends StatefulWidget {
  final String title;
  Todo({super.key, required this.title});

  @override
  State<Todo> createState() => _TodoState(title: title);
}

class _TodoState extends State<Todo> {
  final String title;
  _TodoState({required this.title});

  List<Map<String, dynamic>> lists = [
    {
      "title": "List 1",
      "status": "pending"
    }
  ];

  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(
                lists[index]["title"],
                style: TextStyle(
                  decoration: lists[index]["status"] == "completed" ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              checkColor: Colors.white,
              value: lists[index]["status"] == "completed",
              onChanged: (bool? value) {
                setState(() {
                  lists[index]["status"] == "completed";
                });
              },
              controlAffinity: ListTileControlAffinity.leading, 
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
              onPressed: () => {
                 showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Add Todo"),
                      content: Column(
                        children: [
                          TextField(
                            controller: text,
                            decoration: const InputDecoration(  
                              border: OutlineInputBorder(),  
                              labelText: 'List',  
                              hintText: 'Add Todo list..',  
                            ), 
                          ),
                          const SizedBox(height: 20,),
                          MyButton(
                            text: "Add", 
                            width: 250, 
                            height: 40, 
                            bgcolor: "#91d2ff", 
                            borderRadius: 10, 
                            fgcolor: "#000000", 
                            fontSize: 13, 
                            onPressed: () => {
                              setState((){
                                lists.add({
                                  "title": text.text,
                                  "status": "pending"
                                });
                                lists = lists;
                              })
                            }
                          )
                      ]),
                    );
                  }
                 )
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
      ),
    );
  }
}
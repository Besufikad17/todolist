import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/components/button.dart';
import 'package:todolist/components/card.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 62, 138)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titles = ["title 1", "title 2", "title 3"];
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return MyCard(title: titles[index]);
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
                              labelText: 'Todo',  
                              hintText: 'Add Todo..',  
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
                              titles.add(text.text)
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/config/router/args.dart';
import 'package:todolist/data/datasource/local/local_list_service.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/app_bar.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/utils/resources/colors.dart';
import 'package:todolist/utils/resources/widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  
  TextEditingController text = TextEditingController();
  LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoBloc(repository);
    final args = ModalRoute.of(context)!.settings.arguments as TodoPageArgs;
    final textColor = Theme.of(context).textTheme.displayLarge!.color;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MyAppBar(
         title: args.title, 
        ),
      ),
      body: BlocProvider(
        create: (context) => TodoBloc(repository)..add(GetTodo(args.title, args.status)),
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) => {},
          builder: (BuildContext context, TodoState state) {
            if (state is TodoLoading) {
              return buildLoading(context);
            } else if (state is TodoLoaded) {
              return _buildLoaded(context.read<TodoBloc>(), state, args.title, textColor!);
            }
            return Container();
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: textColor,  
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddPopup(text: text, bloc: bloc, flag: "list");
            }
          );
        }
      ),
    );
  }

  Widget _buildLoaded(TodoBloc bloc, TodoLoaded state, String title, Color checkColor) {
    if(state.todo.lists.isEmpty) {
      return  Center(
        child: MyText(text: "No lists :(", size: 15, color: "#${toHex(checkColor).substring(3)}",),
      );
    }else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.todo.lists.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(
                    state.todo.lists[index].title,
                    style: TextStyle(
                      color: checkColor,
                      decoration: state.todo.lists[index].status == ListStatus.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    ),
                  ),
                  checkColor: checkColor,
                  side: BorderSide(
                    color: checkColor
                  ),
                  value: state.todo.lists[index].status == ListStatus.completed,
                  onChanged: (bool? value) {
                    if (value ?? false) {
                      bloc.add(UpdateListStatus(ListStatus.completed, state.todo.lists[index].title, title));
                    } else {
                      bloc.add(UpdateListStatus(ListStatus.pending, state.todo.lists[index].title, title));
                    }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }
            ),
          ),
        ],
      );
    }
  }
}

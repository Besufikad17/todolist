import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/datasource/local/theme_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/data/repository/theme_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/theme_bloc.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/side_bar.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/presentation/components/text_field.dart';
import 'package:todolist/utils/resources/widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ThemeBloc themeBloc = ThemeBloc(ThemeRepositoryImpl(locator<Box<ThemeModel>>()));
  final TextEditingController text = TextEditingController();
  final TextEditingController searchField = TextEditingController();
  final LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoBloc(repository);
    final textColor = Theme.of(context).textTheme.displayLarge!.color;

    return Scaffold(
      drawer: const MySideBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SizedBox(
                      width: constraints.maxWidth, 
                      height: 40, 
                      child: MyTextField(
                        controller: searchField,
                        hintText: "Search todo..",
                        borderColor: Theme.of(context).colorScheme.secondary,
                      )
                    );
                  }
                ),
                const SizedBox(height: 10,),
                MyText(text: "My Todos", size: 20, isBold: true),
                const SizedBox(height: 10,),
                BlocProvider(
                  create: (context) => bloc..add(const GetAllTodos()),
                  child: BlocConsumer<TodoBloc, TodoState>(
                    listener: (context, state) => {},
                    builder: (BuildContext context, TodoState state) {
                      if (state is TodoInitial) {
                        return Center(
                          child: MyText(text: "No todos :(", size: 15),
                        );
                      } else if (state is TodoLoading) {
                        return buildLoading(context);
                      } else if (state is TodosLoaded) {
                        return buildLoaded(context, state.todos, context.read<TodoBloc>());
                      } else if(state is TodoAdded || state is TodoUpdated) {
                        bloc.add(const GetAllTodos());
                        // FIXME
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
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
              return AddPopup(text: text, bloc: bloc, flag: "todo");
            }
          );
        }
      ),
    );
  }
}
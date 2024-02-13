import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/datasource/local/local_todo_service.dart';
import 'package:todolist/data/repository/local_todo_repository_impl.dart';
import 'package:todolist/locator.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/components/app_bar.dart';
import 'package:todolist/presentation/components/side_bar.dart';
import 'package:todolist/utils/resources/widget.dart';

class ArchivePage extends StatelessWidget {
  ArchivePage({super.key});
  
  final LocalTodoRepositoryImpl repository = LocalTodoRepositoryImpl(locator.get<Box<LocalTodo>>());

  @override
  Widget build(BuildContext context) {
    final TodoBloc bloc = TodoBloc(repository);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: MyAppBar(
          title: "Archive",
        )
      ),
      drawer: const MySideBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => bloc..add(const GetArchivedTodos()),
              child: BlocConsumer<TodoBloc, TodoState>(
                listener: (context, state) => {},
                builder: (context, state) {
                  if(state is TodosLoaded) {
                    return buildLoaded(context, state.todos, bloc);
                  }else if (state is TodoLoading) {
                    return buildLoading(context);
                  } else if (state is TodosLoaded) {
                    return buildLoaded(context, state.todos, context.read<TodoBloc>());
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
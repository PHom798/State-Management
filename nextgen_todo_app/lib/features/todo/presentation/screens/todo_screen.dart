import 'package:flutter/material.dart';
import 'package:nextgen_todo_app/core/theme/app_colors.dart';
import 'package:nextgen_todo_app/features/todo/data/datasource/mocko_todo_datasource.dart';
import 'package:nextgen_todo_app/features/todo/data/models/todo_model.dart';
import 'package:nextgen_todo_app/features/todo/presentation/widgets/todo_dialog.dart';

import '../widgets/overview_card.dart';
import '../widgets/tasks_cards.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<TodoModel> todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.addAll(MockoTodoDatasource.getDummyTodos());
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //overview card widget
            OverViewCard(textTheme: textTheme),

            //Task builder with listviewBuilder
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TasksCards(
                    todo: todo,
                    onEdit: () {},
                    onDelete: () {},
                    onChanged: (bool? value) {
                      setState(() {
                        todos[index]= todo.copyWith(
                          isCompleted: value ?? false
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(context: context, builder: (context) => TodoDialog());
        },
        icon: Icon(Icons.add),
        label: Text("Add Task"),
      ),
    );
  }
}

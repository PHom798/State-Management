import 'package:flutter/material.dart';
import 'package:nextgen_todo_app/features/todo/data/models/todo_model.dart';

class TasksCards extends StatelessWidget {
  final TodoModel todo;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const TasksCards({super.key, required this.todo, required this.onChanged, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Checkbox(
              value: todo.isCompleted,
              shape: CircleBorder(),
              onChanged: onChanged,
            ),
            Expanded(child: Text(todo.title,style: textTheme.titleMedium?.copyWith(decoration: todo.isCompleted? TextDecoration.lineThrough : .none),)),
            IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}

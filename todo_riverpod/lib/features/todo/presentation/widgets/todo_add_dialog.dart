import 'package:flutter/material.dart';

class TodoAddDialog extends StatefulWidget {
  const TodoAddDialog({super.key});

  @override
  State<TodoAddDialog> createState() => _TodoAddDialogState();
}

class _TodoAddDialogState extends State<TodoAddDialog> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Dialog(
      child: Padding(padding: EdgeInsets.all(12),
      child: Column(
        mainAxisSize: .min,
        children: [
          //title
          Text('New Todo',style: textTheme.titleLarge,),
        ],
      ),),
    );
  }
}

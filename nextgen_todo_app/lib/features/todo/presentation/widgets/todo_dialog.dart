import 'package:flutter/material.dart';

class TodoDialog extends StatefulWidget {
  const TodoDialog({super.key});

  @override
  State<TodoDialog> createState() => _TodoDialogState();
}

class _TodoDialogState extends State<TodoDialog> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text("New Task", style: textTheme.titleLarge),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: InputDecoration(hintText: "Enter a new task"),
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),

                ElevatedButton(
                  onPressed: () {
                    final title = textController.text;
                    if (title.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a title')),
                      );
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

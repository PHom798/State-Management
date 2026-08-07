import 'package:flutter/material.dart';
import 'package:todo_riverpod/features/todo/presentation/widgets/todo_add_dialog.dart';

import '../widgets/overview_card.dart';
import '../widgets/todo_tile.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //overview card widget
            OverviewCard(
              theme: theme,
              textTheme: textTheme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TodoTile();
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context)=> TodoAddDialog());

      },child: Icon(Icons.add),),
    );
  }
}

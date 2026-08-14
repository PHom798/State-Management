import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    required this.theme,
    required this.textTheme,
    required this.colorScheme,
  });

  final ThemeData theme;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
    color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Todo Progress',style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4,),
                  Text('Complete your first task ',style: textTheme.titleMedium?.copyWith(color: theme.hintColor),)
                ],
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text('0/10',style:textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
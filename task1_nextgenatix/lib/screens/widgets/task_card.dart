import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String text1,text2;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

  const TaskCard({super.key, required this.text1, required this.text2, required this.isCompleted, required this.onChanged, });

  @override
  Widget build(BuildContext context) {
    return  //Task card
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffE2E8F0)),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged:onChanged,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff171827),
                    ),
                  ),
                  const SizedBox(height: 5),

                   Text(
                    text2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff77798A),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert, color: Color(0xff77798A)),
          ],
        ),
      );
  }
}

import 'package:flutter/material.dart';

class continueWith_line extends StatelessWidget {
  const continueWith_line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //left line
        const Expanded(
          child: Divider(
            color: Color(0xffE2E8F0), //subtle light grey color
            thickness: 1, //line thickness
            endIndent: 16, //Gap between the line and text
          ),
        ),

        //Middle text
        Text(
          'or continue with',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(
              0xff77798A,
            ), // Matches subtitle color
          ),
        ),

        const Expanded(
          child: Divider(
            indent: 16,
            color: Color(0xffE2E8F0),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}

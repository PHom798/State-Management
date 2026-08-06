import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do APp"),
      ),
      body: SafeArea(child:Column(
        children: [
          Card(
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Todo Progress'),
                    Text('Complete your first task ')
                  ],
                )
              ],
            ),
          )
        ],
      ))
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nextgen_todo_app/features/todo/data/models/todo_model.dart';

class MockoTodoDatasource {
  static List<TodoModel> getDummyTodos() {
    return [
      TodoModel(
        id: '1',
        title: 'Buy groceries',
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
      TodoModel(
        id: '2',
        title: 'Complete Flutter UI design',
        isCompleted: true,
        createdAt: DateTime.now(),
      ),
      TodoModel(
        id: '3',
        title: 'Gym workout',
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
    ];
  }
}

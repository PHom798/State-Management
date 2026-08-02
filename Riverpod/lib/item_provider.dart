// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/legacy.dart';
// import 'package:riverpod_demo/Model/item.dart';
// import 'package:riverpod_demo/item.dart';
//
// final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){
//   return ItemNotifier() ;
// });
//
// class ItemNotifier extends StateNotifier<List<Item>>{
//   ItemNotifier():super([]);
//
//   void addItem(String name){
//     final item = Item(id: DateTime.now().toString(), name: name);
//     state.add(item);
//     state = state.toList();
//   }
//
//   void deleteItem(String id){
//     state.removeWhere((item)=>item.id == id);
//     state = state.toList();
//   }
//
//   void updateItem(String id, String name){
//     int foundIndex = state.indexWhere((item)=> item.id == id);
//     state[foundIndex].name = name;
//     state = state.toList();
//   }
// }
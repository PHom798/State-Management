// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_demo/item_provider.dart';
//
// class ItemScreen extends ConsumerWidget {
//   const ItemScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("State Notifier Provider"),
//
//       ),
//       body: Consumer(builder: (ctx,ref,child){
//         final item = ref.watch(itemProvider);
//
//         return item.isEmpty ? Center(child: Text("No data found"),):
//         ListView.builder(
//             itemCount: item.length,
//             itemBuilder: (context,index){
//               final itemDetail = item[index];
//               return ListTile(
//                 title: Text(itemDetail.name),
//                 trailing:Row(
//                   mainAxisSize: .min,
//                   children: [
//
//                     IconButton(onPressed: (){
//                       ref.read(itemProvider.notifier).updateItem(itemDetail.id, 'updated item');
//                     }, icon: Icon(Icons.edit)),
//                     IconButton(onPressed: (){
//                       ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
//                     }, icon: Icon(Icons.delete))
//                   ],
//                 ),
//
//               );
//
//
//             });
//
//       }),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         ref.read(itemProvider.notifier).addItem('Name');
//
//       },child: Icon(Icons.add),),
//     );
//   }
// }

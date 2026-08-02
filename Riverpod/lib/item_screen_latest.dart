import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/provider/notifier_provider.dart';

class ItemScreenLatest extends ConsumerWidget {
  const ItemScreenLatest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("List items"),
        actions: [
         PopupMenuButton(onSelected:(value){
           ref.read(favouriteProvider.notifier).favourite(value);


         },
             itemBuilder: (BuildContext context){
           return const [
             PopupMenuItem(value: 'All',child: Text("All"),),
             PopupMenuItem(value: 'Favourite',child: Text("Favourite"),)
           ];
         })

        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              ref.read(favouriteProvider.notifier).filterList(value);

            },
            decoration: InputDecoration(
              hintText: 'Search Items',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
          )
          ,
          Expanded(
              child:ListView.builder(itemCount: favouriteList.filteredItems.length,
                  itemBuilder: (context,index){
                final item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(item.favourites ? Icons.favorite : Icons.favorite_border),
                );
                  }) ),

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(favouriteProvider.notifier).addItem();

      },
      child: Icon(Icons.add),),
    );
  }
}

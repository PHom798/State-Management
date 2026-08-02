
//For Favourites items
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_demo/Model/item.dart';
import 'package:riverpod_demo/provider/favourites_states.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouritesStates>((ref){
  return FavouriteNotifier();
});

//Notifier for favourites items
class FavouriteNotifier extends StateNotifier<FavouritesStates>{
  FavouriteNotifier():super(FavouritesStates(allItems: [], filteredItems: [], searchKey: ''));

  void addItem(){
    List<Item> item =[
      Item(id: 1, name: 'MacBook', favourites: true),
      Item(id: 2, name: 'Samsung Galaxy S24 Ultra', favourites: false),
      Item(id: 3, name: 'Asus Zenbook', favourites: true),
      Item(id: 4, name: 'iphone 17 pro', favourites: false),
      Item(id: 5, name: 'Google pixel 9', favourites: true),
      Item(id: 6, name: 'F-force 360', favourites: false),



    ];
    state = state.copyWith(allItems: item.toList(), filteredItems:  item.toList());
  }

  void filterList(String searchKeyword){
  state= state.copyWith(filteredItems: _filterItems(state.allItems, searchKeyword));

  }

  void favourite(String options){
    state= state.copyWith(filteredItems:  _filterFavouriteItems(state.allItems, options));

  }
  List<Item> _filterFavouriteItems(List<Item> items,String options ){
    if(options == 'All'){
      return items;
    }
    return items
        .where((item)=> item.favourites ==true).toList();
  }


  List<Item> _filterItems(List<Item> items,String searchKeyword ){
    if(searchKeyword.isEmpty){
      return items;
    }
     return items
        .where((item)=> item.name.toLowerCase().contains(searchKeyword.toLowerCase())).toList();
  }

}
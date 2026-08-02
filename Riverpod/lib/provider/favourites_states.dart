
import 'package:riverpod_demo/Model/item.dart';

class FavouritesStates {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String searchKey;
  FavouritesStates({ required this.allItems, required this.filteredItems, required this.searchKey});

  FavouritesStates copyWith({
    List<Item> ? allItems,
    List<Item> ? filteredItems,
    String ? searchKey
    
    
}){
    return FavouritesStates(filteredItems: filteredItems ?? this.filteredItems,
        allItems: allItems ?? this.allItems,
        searchKey: searchKey ?? this.searchKey);
  }


}
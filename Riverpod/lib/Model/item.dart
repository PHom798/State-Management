class Item {
  final int id;
  final String name;
  final bool favourites;
  Item({required this.id, required this.name, required this.favourites});

  Item copyWith({String? name, int? id, bool? favourites}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      favourites: favourites ?? this.favourites,
    );
  }
}

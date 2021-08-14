import 'package:food_delivery/models/catalog.dart';

class CartModel {
  // catalog fileds
  late CatalogModel _catalog;

  // collection of Ids - store ids of each item
  final List<int> _itemIds = [];

  // Get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(catalog != null);
    _catalog = newCatalog;
  }

  // Get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

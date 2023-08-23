// ignore_for_file: prefer_final_fields, sdk_version_since

import 'package:pokedex/shared/models/item.dart';

class ItemsStorage {
  final Map<String, Item> _itemsMap = {};

  List<Item> getItems() => _itemsMap.values.toList();

  void setItems(List<Item> items) {
    for (var item in items) {
      _itemsMap[item.name] = item;
    }
  }
}

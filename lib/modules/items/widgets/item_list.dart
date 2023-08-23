import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/item.dart';

class ItemListWidget extends StatelessWidget {
  final List<Item> items;

  const ItemListWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        Text(item.name);
      },
    );
  }
}

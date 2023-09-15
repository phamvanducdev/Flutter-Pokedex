import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex/modules/items/widgets/item.dart';
import 'package:pokedex/shared/models/item.dart';

class ItemListWidget extends StatefulWidget {
  final List<Item> items;

  const ItemListWidget({
    super.key,
    required this.items,
  });

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  static const _pageSize = 20;

  final PagingController<int, Widget> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _fetchPage(int pageKey) async {
    final maxRange = widget.items.length;
    final initialRange = pageKey * _pageSize;
    final finalRange = (pageKey * _pageSize) + _pageSize > maxRange ? maxRange : (pageKey * _pageSize) + _pageSize;

    List<Widget> items = [];

    for (int index = initialRange; index < finalRange; index++) {
      final item = widget.items[index];
      items.add(ItemWidget(item: item));
      _preCacheItemImage(item: item);
    }

    if (maxRange == finalRange) {
      _pagingController.appendLastPage(items);
    } else {
      _pagingController.appendPage(items, pageKey + 1);
    }
  }

  void _preCacheItemImage({required Item item}) {
    if (item.imageUrl != null) {
      precacheImage(CachedNetworkImageProvider(item.imageUrl!), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      sliver: PagedSliverList.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Widget>(
          itemBuilder: (context, item, index) => item,
        ),
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}

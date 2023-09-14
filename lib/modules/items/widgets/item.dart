import 'package:flutter/material.dart';
import 'package:pokedex/shared/models/item.dart';
import 'package:pokedex/shared/utils/image_utils.dart';
import 'package:pokedex/theme/app_theme.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return ListTile(
      leading: item.imageUrl != null
          ? ImageUtils.networkImage(
              imageURL: item.imageUrl!,
              height: 24,
              width: 24,
            )
          : Icon(
              Icons.image_not_supported,
              color: appColors.unknownIcon.withOpacity(0.2),
              size: 16,
            ),
      title: Text(
        item.name,
        style: textTheme.bodyLarge,
      ),
      trailing: Text(
        item.category,
        style: textTheme.bodyLarge,
      ),
      subtitle: item.effect.trim().isNotEmpty
          ? Text(
              item.effect,
              style: textTheme.titleMedium,
            )
          : null,
    );
  }
}

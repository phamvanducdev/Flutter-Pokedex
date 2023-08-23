import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/items/items_vm.dart';
import 'package:pokedex/modules/items/widgets/item_list.dart';
import 'package:pokedex/shared/ui/drawer/drawer_menu.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/shared/ui/widgets/app_bar.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  ItemsViewModel viewModel = GetIt.instance<ItemsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getColors(context).panelBackground,
      endDrawer: const DrawerMenuWidget(),
      body: Stack(
        children: [
          SafeArea(
            child: CustomScrollView(
              slivers: [
                AppBarWidget(
                  title: 'Items',
                  animationPath: AppConstants.squirtleLottie,
                ),
                ItemsWidget(viewModel: viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsWidget extends StatefulWidget {
  final ItemsViewModel viewModel;

  const ItemsWidget({
    super.key,
    required this.viewModel,
  });

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: widget.viewModel.fetchItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading...
          return SliverFillRemaining(
            child: Center(
              child: AnimatedPokeballWidget(
                size: 120,
                color: AppTheme.getColors(context).pokeballLogoGray,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // Failed
          return const SliverFillRemaining(
            child: Center(
              child: Text('Failed fetching data!'),
            ),
          );
        } else {
          // Success
          final items = widget.viewModel.items;
          return SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: ItemListWidget(items: items),
          );
        }
      },
    );
  }
}

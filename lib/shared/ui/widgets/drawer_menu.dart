import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/home/home_screen.dart';
import 'package:flutter_pokedex/modules/items/items_screen.dart';
import 'package:flutter_pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:flutter_pokedex/shared/ui/widgets/drawer_menu_item.dart';
import 'package:flutter_pokedex/shared/utils/app_constants.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';
import 'package:lottie/lottie.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appColors = AppTheme.getColors(context);
    var textTheme = AppTheme.of(context).textTheme;

    return Container(
      color: appColors.backgroundColor,
      width: size.width * 0.75,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    AnimatedPokeballWidget(
                      size: 24,
                      color: AppTheme.getColors(context).pokeballLogoBlack,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Poké',
                      style: textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 72,
                  ),
                  children: [
                    DrawerMenuItemWidget(
                      itemText: 'Poké',
                      itemColor: appColors.drawerPokedex,
                      onTapListener: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return const HomeScreen();
                          }),
                        );
                      },
                    ),
                    DrawerMenuItemWidget(
                      itemText: 'Items',
                      itemColor: appColors.drawerItems,
                      onTapListener: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return const ItemsScreen();
                          }),
                        );
                      },
                    ),
                    DrawerMenuItemWidget(
                      itemText: 'Moves',
                      itemColor: appColors.drawerMoves,
                      onTapListener: () {},
                    ),
                    DrawerMenuItemWidget(
                      itemText: 'Abilities',
                      itemColor: appColors.drawerAbilities,
                      onTapListener: () {},
                    ),
                    DrawerMenuItemWidget(
                      itemText: 'Type Charts',
                      itemColor: appColors.drawerTypeCharts,
                      onTapListener: () {},
                    ),
                    DrawerMenuItemWidget(
                      itemText: 'Locations',
                      itemColor: appColors.drawerLocations,
                      onTapListener: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Lottie.asset(
              AppConstants.diglettLottie,
            ),
          )
        ],
      ),
    );
  }
}

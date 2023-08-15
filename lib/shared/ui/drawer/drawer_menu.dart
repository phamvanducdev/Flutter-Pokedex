import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/ui/drawer/drawer_menu_item.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

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
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
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
                        'Podex',
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
                      mainAxisExtent: 64,
                    ),
                    children: [
                      DrawerMenuItemWidget(
                        itemText: 'Pokédex',
                        itemColor: appColors.drawerPokedex,
                        onTapListener: () {},
                      ),
                      DrawerMenuItemWidget(
                        itemText: 'Items',
                        itemColor: appColors.drawerItems,
                        onTapListener: () {},
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/shared/ui/widgets/animated_pokeball.dart';
import 'package:pokedex/theme/app_theme.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  final String animationPath;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.animationPath,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 164,
      collapsedHeight: 56,
      elevation: 0,
      backgroundColor: AppTheme.getColors(context).panelBackground,
      actions: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: AppTheme.getColors(context).appBarButtons,
          ),
        ),
      ],
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            centerTitle: false,
            background: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Lottie.asset(
                  widget.animationPath,
                  height: 100,
                ),
              ),
            ),
            titlePadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Row(
              children: [
                AnimatedPokeballWidget(
                  size: 24,
                  color: AppTheme.getColors(context).pokeballLogoBlack,
                ),
                const SizedBox(width: 4),
                Text(widget.title, style: textTheme.displayLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

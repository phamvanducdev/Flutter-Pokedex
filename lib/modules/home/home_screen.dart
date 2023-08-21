import 'package:flutter/material.dart';
import 'package:flutter_pokedex/shared/ui/widgets/drawer_menu.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/ui/drawer/drawer_menu.dart';
import 'package:pokedex/modules/home/home_vm.dart';
import 'package:pokedex/modules/pokemons/pokemons_view.dart';
import 'package:pokedex/shared/ui/widgets/app_bar.dart';
import 'package:pokedex/shared/utils/app_constants.dart';
import 'package:pokedex/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = GetIt.instance<HomeViewModel>();

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
                  title: 'Podex',
                  animationPath: AppConstants.squirtleLottie,
                ),
                PokemonsView(viewModel: viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

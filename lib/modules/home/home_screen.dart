import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_pokedex/modules/home/home_vm.dart';
import 'package:flutter_pokedex/modules/pokemons/pokemons_view.dart';
import 'package:flutter_pokedex/shared/ui/widgets/app_bar.dart';
import 'package:flutter_pokedex/shared/utils/app_constants.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel viewModel = GetIt.instance<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.getColors(context).panelBackground,
      body: Stack(
        children: [
          SafeArea(
            child: CustomScrollView(
              slivers: [
                AppBarWidget(
                  title: 'Poké',
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

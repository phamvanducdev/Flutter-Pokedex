// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/theme/app_theme.dart';

class DarkAppColors extends AppColors {
  DarkAppColors(super.context);

  @override
  Color get backgroundColor => Color(0xFF000000);

  @override
  Color get pokemonTabTitle => Color(0xFF303943).withOpacity(0.4);

  @override
  Color get selectPokemonTabTitle => Color(0xFF303943);

  @override
  Color get selectedGenerationFilter => Color(0xFFFFFFFF).withOpacity(0.5);

  @override
  Color get pokeballLogoBlack => Color(0xFFD8D8D8);

  @override
  Color get pokeballLogoGray => Color(0xFFFFFFFF).withOpacity(0.2);

  @override
  Color get generationFilter => Color(0xFF121212);

  @override
  Color get panelBackground => Color(0xFF000000);

  @override
  Color get pokemonDetailsTitleColor => Color(0xFF121212);

  @override
  Color get appBarButtons => Color(0xFFFFFFFF);
}

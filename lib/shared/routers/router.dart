import 'package:flutter/material.dart';
import 'package:flutter_pokedex/modules/home/home_screen.dart';

abstract class Router {
  static String home = "/";

  static Map<String, WidgetBuilder> getRoutes(context) {
    return {
      home: (context) => const HomeScreen(),
    };
  }
}

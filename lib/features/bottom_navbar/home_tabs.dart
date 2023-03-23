import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';
import 'package:movies_app/features/favorites/presentation/pages/favorites_page.dart';

enum HomeTabs { home, favorites }

extension HomeTabExtension on HomeTabs {
  static final tabImagesPath = {
    HomeTabs.home: Icons.home,
    HomeTabs.favorites: Icons.favorite,
  };

  static final tabTitle = {
    HomeTabs.home: 'Home',
    HomeTabs.favorites: 'Favorites',
  };

  static final tabRoute = {
    HomeTabs.home: HomePage.routeName,
    HomeTabs.favorites: FavoritesPage.routeName,
  };

  static final snakeCaseTitle = {
    HomeTabs.home: '/home',
    HomeTabs.favorites: '/favorites',
  };

  String getTabTitle() => tabTitle[this]!;

  String getTabRoute() => tabRoute[this]!;

  IconData getImagePath() => tabImagesPath[this]!;

  String getSnakeCaseTitle() => snakeCaseTitle[this]!;
}

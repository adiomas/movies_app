import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_notifier.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_state.dart';

void listenBottomNavbar(WidgetRef ref, BuildContext context) {
  ref.listen<FavoritesState>(favoritesNotifierProvider, (previous, next) {
    next.maybeWhen(
      orElse: () {},
      addedToFavorites: () => showSnackBar('Added to favorites', context),
      removedFromFavorites: () =>
          showSnackBar('Removed from favorites', context),
    );
  });
}

void showSnackBar(String text, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

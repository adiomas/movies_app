import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_notifier.dart';
import 'package:movies_app/features/favorites/presentation/widgets/favorites_page_body.dart';

class FavoritesPage extends ConsumerWidget {
  static const routeName = '/favorites';
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesNotifierProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          favoritesState.maybeWhen(
            orElse: () => Container(),
            empty: () => const Center(
                child: Text(
              'You have no favorites yet!',
              textAlign: TextAlign.center,
            )),
            data: (favorites) => Expanded(
              child: SingleChildScrollView(
                child: Align(
                  child: FavoritesPageBody(
                    movies: favorites!.movies,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/common/domain/entities/favorites.dart';
import 'package:movies_app/common/domain/entities/movie.dart';
import 'package:movies_app/common/domain/providers/base_router_provider.dart';
import 'package:movies_app/features/favorites/domain/notifiers/favorites_notifier.dart';
import 'main/app_environment.dart';

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  Beamer.setPathUrlStrategy();

  Hive.registerAdapter(FavoritesAdapter());
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Favorites>(Favorites.boxName);
  await Hive.openBox<Movie>(Movie.boxName);

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    ref.read(favoritesNotifierProvider.notifier).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseRouter = ref.watch(baseRouterProvider);
    return BeamerProvider(
      routerDelegate: baseRouter,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: EnvInfo.environment != AppEnvironment.PROD,
        title: EnvInfo.appTitle,
        routerDelegate: baseRouter,
        routeInformationParser: BeamerParser(),
        builder: (context, child) => Material(
          type: MaterialType.transparency,
          child: child ?? const SizedBox(),
        ),
      ),
    );
  }
}

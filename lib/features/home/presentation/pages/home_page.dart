import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/home/domain/notifiers/movies_notifier.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_page_body.dart';

class HomePage extends ConsumerStatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(moviesNotifierProvider).maybeWhen(
            orElse: () => ref.read(moviesNotifierProvider.notifier).getMovies(),
            loaded: (_) {},
          );
    });
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final buildState = ref.watch(moviesNotifierProvider);

    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: const [
              Expanded(
                child: SingleChildScrollView(
                  child: Align(
                    child: MoviesPageBody(),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildState.maybeMap(
          orElse: () => const SizedBox(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }
}

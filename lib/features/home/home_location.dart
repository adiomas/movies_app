import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/pages/home_page.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomePage(),
        ),
      ];

  @override
  List<String> get pathPatterns => ['/home'];
}

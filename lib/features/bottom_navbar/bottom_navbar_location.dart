import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/bottom_navbar/bottom_navbar.dart';

class BottomNavbarLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('main'),
        title: 'Home',
        child: BottomNavbar(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/home', '/favorites'];
}

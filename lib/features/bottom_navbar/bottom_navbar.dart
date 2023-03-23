import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/features/bottom_navbar/home_tabs.dart';
import 'package:movies_app/features/bottom_navbar/navbar_delegates.dart';
import 'package:movies_app/features/bottom_navbar/provider.dart';

class BottomNavbar extends ConsumerStatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends ConsumerState<BottomNavbar> {
  late int currentIndex;
  final _routerDelegates = listOfBeamerDelegates();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    currentIndex = _getCurrentString(uriString);
  }

  @override
  Widget build(BuildContext context) {
    listenBottomNavbar(ref, context);

    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              Beamer(
                routerDelegate: _routerDelegates.first,
              ),
              Beamer(
                routerDelegate: _routerDelegates[1],
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0,
            backgroundColor: Colors.grey.withOpacity(0.1),
            selectedItemColor: Colors.red.shade400,
            unselectedItemColor: Colors.black.withOpacity(0.6),
            type: BottomNavigationBarType.fixed,
            items: HomeTabs.values.map(
              (tab) {
                return BottomNavigationBarItem(
                  icon: Icon(
                    tab.getImagePath(),
                  ),
                  label: tab.getTabTitle(),
                );
              },
            ).toList(),
            onTap: (index) {
              if (index != currentIndex) {
                setState(() => currentIndex = index);
                _routerDelegates[currentIndex].update(rebuild: false);
              }
            },
          ),
        ),
      ],
    );
  }
}

int _getCurrentString(String uriString) {
  return HomeTabs.values
      .where((element) => uriString.startsWith(element.getSnakeCaseTitle()))
      .first
      .index;
}

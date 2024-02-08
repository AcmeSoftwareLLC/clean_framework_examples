import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:flutter/material.dart';

class ExampleNavBar extends StatelessWidget {
  const ExampleNavBar({
    super.key,
    required this.pageIndex,
    required this.onDestinationSelected,
  });

  final int pageIndex;

  final void Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) => onDestinationSelected(index),
      backgroundColor: FirebaseExampleTheme.of(context).primaryBackground,
      indicatorColor: Colors.transparent,
      selectedIndex: pageIndex > 1 ? 0 : pageIndex,
      height: 65.0,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        // NavigationDestination(
        //   selectedIcon: Icon(Icons.search),
        //   icon: Icon(Icons.search_outlined),
        //   label: '',
        // ),
        NavigationDestination(
          selectedIcon: Icon(Icons.add_to_photos),
          icon: Icon(Icons.add_to_photos_outlined),
          label: '',
        ),
        // NavigationDestination(
        //   selectedIcon: Icon(Icons.view_module),
        //   icon: Icon(Icons.view_module_outlined),
        //   label: '',
        // ),
      ],
    );
  }
}

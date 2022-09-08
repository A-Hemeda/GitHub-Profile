import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class AppbarTitle extends StatelessWidget {
 final GlobalKey<SideMenuState> sideMenuKey;
  const AppbarTitle({
    Key? key,
    required this.sideMenuKey,
    required this.isCollapsed,
    required this.place,
  }) : super(key: key);

  final bool isCollapsed;
  final String place;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              final _state = sideMenuKey.currentState;
              if (_state!.isOpened)
                _state.closeSideMenu(); // close side menu
              else
                _state.openSideMenu(); // open side menu
            },
            icon: Icon(Icons.menu)),
        if (isCollapsed) Text(place),
        if (isCollapsed) Icon(Icons.location_on_sharp),
      ],
    );
  }
}

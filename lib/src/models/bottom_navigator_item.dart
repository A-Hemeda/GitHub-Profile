import 'package:flutter/material.dart';

class BottomNavigationItem {
  const BottomNavigationItem(
      {this.key, this.icon, this.page, this.onTap, this.title});

  final Widget page;
  final IconData icon;
  final String title;
  final Key key;
  final Function(int) onTap;
}

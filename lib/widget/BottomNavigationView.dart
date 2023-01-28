import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
class BottomNavItem {
  final String iconPath;
  final String label;

  BottomNavItem({required this.iconPath, required this.label});
}

class BottomNav extends StatefulWidget {
  final List<BottomNavItem> items;
  final Function(int) onTap;
  const BottomNav({Key? key, required this.items, required this.onTap}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState(items: items, onTap: onTap);
}

class _BottomNavState extends State<BottomNav> {
  final List<BottomNavItem> items;
  final Function(int) onTap;

  int _currentPosition = 0;
  _BottomNavState({required this.items, required this.onTap});
  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItems = items.map((e) =>
        BottomNavigationBarItem(
            icon: Image.asset(e.iconPath),
          label: e.label,
          backgroundColor: colorBottomNav
        )).toList();
    return BottomNavigationBar(
      items: bottomNavigationBarItems,
      onTap: (index) {
        _currentPosition = index;
        onTap(index);
        setState(() {
        });
      },
      currentIndex: _currentPosition,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      elevation: 10,
      selectedFontSize: 12,
      type: BottomNavigationBarType.shifting,
    );
  }
}

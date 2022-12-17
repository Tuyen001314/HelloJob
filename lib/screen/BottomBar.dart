import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/screen/DetailJob.dart';
import 'package:hellojob/screen/Home.dart';
import 'package:hellojob/screen/ItemViewSave.dart';

import '../constants.dart';
import 'Profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarSate();
}

class _BottomBarSate extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    ItemViewSave(),
    DetailJob(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        elevation: 10,
        selectedFontSize: 12,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: colorText,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset('assets/icons/home.png'),
            label: "Trang chủ",
            backgroundColor: colorBottomNav,
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/icons/connect.png'),
            label: 'Kết nối',
            backgroundColor: colorBottomNav,
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/icons/suggest.png'),
            label: 'Cẩm nang',
            backgroundColor: colorBottomNav,
          ),
          BottomNavigationBarItem(
            icon: new Image.asset('assets/icons/profile.png'),
            label: 'Hồ sơ',
            backgroundColor: colorBottomNav,
          ),
        ],
      ),
    );
  }
}

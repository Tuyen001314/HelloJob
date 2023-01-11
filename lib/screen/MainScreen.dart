import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/state/UserState.dart';
import 'package:hellojob/screen/DetailJob.dart';
import 'package:hellojob/screen/Home.dart';
import 'package:hellojob/screen/ItemViewSave.dart';
import 'package:hellojob/screen/profile/ProfileGuestScreen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'profile/Profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenSate();
}

class _MainScreenSate extends State<MainScreen> {
  int _selectedIndex = 0;
  late UserState _userState;
  late Widget _currentScreen;

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    ItemViewSave(),
    DetailJob(),
    Profile(),
    ProfileGuestScreen(),
  ];


  @override
  void initState() {
    super.initState();
    _userState = Provider.of<UserState>(context, listen: false);
    _currentScreen = _widgetOptions[0];
    _userState.addListener(() {
      setState(() {

      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 3) {
        if (_userState.currentUser.data == null) {
          _currentScreen = _widgetOptions[4];
          return;
        }
      }
      _currentScreen = _widgetOptions[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentScreen,
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

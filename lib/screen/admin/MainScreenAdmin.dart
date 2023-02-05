import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/BottomNavigationView.dart';
import '../profile/Profile.dart';
import 'HomeAdmin.dart';

class AdminMainScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'AdminMainScreen';
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  late Widget _currentScreen;

  final List<Widget> _screens = <Widget>[
    const HomeAdminScreen(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _currentScreen = _screens[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentScreen,
      ),
      bottomNavigationBar: BottomNav(
        items: [
          BottomNavItem(iconPath: "assets/icons/home.png", label: "Home"),
          BottomNavItem(iconPath: "assets/icons/profile.png", label: "Ho so"),
        ],
        onTap: (position) {
          _currentScreen = _screens[position];
          setState(() {
          });
        },
      ),
    );
  }
}

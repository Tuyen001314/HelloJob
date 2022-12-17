import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  State<TabBarCustom> createState() => _TabBarSate();
}

class _TabBarSate extends State<TabBarCustom> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                  unselectedLabelColor: Colors.redAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.orangeAccent]),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("APPS"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("MOVIES"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("GAMES"),
                      ),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              Icon(Icons.apps),
              Icon(Icons.movie),
              Icon(Icons.games),
            ]),
          )),
    );
  }
}

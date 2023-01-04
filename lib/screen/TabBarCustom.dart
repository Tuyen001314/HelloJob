import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarCustom extends StatefulWidget {
  @override
  State<TabBarCustom> createState() => _TabBarSate();
}

class _TabBarSate extends State<TabBarCustom> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: Colors.cyan,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(text: "Chi tiết"),
                  Tab(text: "Quyền lợi"),
                  Tab(text: "Yêu cầu"),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                Tab(text: "2"),
                Tab(text: "2"),
                Tab(text: "2"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

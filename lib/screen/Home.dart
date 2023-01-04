import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/ItemView.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      editingController.dispose();
    }

    final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
    // var items = List<String>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Trang chủ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            onChanged: (value) {},
                            controller: editingController,
                            decoration: InputDecoration(
                                labelText: "Search",
                                hintText: "Search",
                                prefixIcon: Icon(
                                    FluentSystemIcons.ic_fluent_search_regular),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(25.0)))),
                          ),
                        ),
                        // Expanded(
                        //   child: ListView.builder(
                        //     shrinkWrap: true,
                        //     // itemCount: items.length,
                        //     itemBuilder: (context, index) {
                        //       return ListTile(
                        //           // title: Text('${items[index]}'),
                        //           );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Đã lưu",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("you are tap");
                          },
                          child: Text("See all",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: colorTenDangNhap,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Đã lưu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tap");
                    },
                    child: Text("See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: colorTenDangNhap,
                        )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Đã lưu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tap");
                    },
                    child: Text("See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: colorTenDangNhap,
                        )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

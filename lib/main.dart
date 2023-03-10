import 'package:flutter/material.dart';
import 'package:platform_convertor_app/view/components/Stepper_Page.dart';
import 'package:platform_convertor_app/view/components/drawer.dart';
import 'package:platform_convertor_app/view/components/settings.dart';

import 'view/components/calls.dart';
import 'view/components/chats.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _homePageState();
}

class _homePageState extends State<MyApp> with SingleTickerProviderStateMixin {
  List list = [
    "CHATS",
    "CALLS",
    "SETTINGS",
  ];
  late TabController controller;

  int page = 0;
  bool switch1 = false;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: const Text(
          "Platform Convertor ",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Switch(
              value: switch1,
              onChanged: (val) {
                setState(() {
                  switch1 = val;
                });
              })
        ],
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          //  indicator: BoxDecoration(),
          tabs: list
              .map(
                (e) => Tab(
                  text: e,
                  // style: TextStyle(fontSize: 22),
                ),
              )
              .toList(),
        ),
        backgroundColor: Colors.teal,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const Padding(
            padding: const EdgeInsets.all(10),
            child: Chats(),
          ),
          Container(
            child: Calls(),
            // color: Colors.amber,
            alignment: Alignment.center,
          ),
          Container(
            child: Settings(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  SingleChildScrollView(
                    child: StatefulBuilder(builder: (context, setState) {
                      return Stepper_Page();
                    }),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

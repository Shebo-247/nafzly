import 'package:flutter/material.dart';
import 'package:nafzly/custom_widgets/bottom_nav_item.dart';
import 'package:nafzly/models/navigation.dart';
import 'package:nafzly/pages/chat_page.dart';
import 'package:nafzly/pages/jobs_page.dart';
import 'package:nafzly/pages/saved_jobs_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> navWidgets = [
    JobsPage(),
    ChatPage(),
    SavedJobsPage()
  ];

  int selectedNavBar = 0;

  List<Navigation> bottomNavList = [
    Navigation(title: Text("Jobs".toUpperCase()), icon: Icon(Icons.work)),
    Navigation(title: Text("Chat".toUpperCase()), icon: Icon(Icons.chat)),
    Navigation(title: Text("Saved".toUpperCase()), icon: Icon(Icons.bookmark)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wazfny"),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: bottomNavList.map((navItem) {
            int currentNavBar = bottomNavList.indexOf(navItem);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedNavBar = currentNavBar;
                });
              },
              child: BottomNavItem(navItem, selectedNavBar == currentNavBar),
            );
          }).toList(),
        ),
      ),
      body: navWidgets[selectedNavBar],
    );
  }
}

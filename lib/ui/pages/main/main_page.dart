import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/pages/favor/favor.dart';
import 'package:flutter_demo_app/ui/pages/home/home.dart';

class JPMainPage extends StatefulWidget {

  static const String route = "/";

  @override
  _JPMainPageState createState() => _JPMainPageState();
}

class _JPMainPageState extends State<JPMainPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: MainData.pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: MainData.items,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class MainData {

  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
      title: Text("收藏"),
      icon: Icon(Icons.favorite)
    ),
    BottomNavigationBarItem(
      title: Text("我的"),
      icon: Icon(Icons.assignment_ind)
    )
  ];

  static List<Widget> pages = [
    JPHomePage(),
    JPFavorPage(),
    JPFavorPage()
  ];

}

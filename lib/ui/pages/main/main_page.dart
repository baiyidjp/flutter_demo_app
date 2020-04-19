import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/pages/favor/favor.dart';
import 'package:flutter_demo_app/ui/pages/home/filter_page.dart';
import 'package:flutter_demo_app/ui/pages/home/home.dart';
import 'package:flutter_demo_app/ui/pages/profile/profile.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/generated/l10n.dart';

class JPMainPage extends StatefulWidget {

  static const String route = "/";

  @override
  _JPMainPageState createState() => _JPMainPageState();
}

class _JPMainPageState extends State<JPMainPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    MainData.context = context;
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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: Layout.kStatusBarHeight+70.pt,
              color: Colors.green,
              alignment: Alignment(0, 0.5),
              child: Text("我是抽屉", style: Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 10.pt),
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text("就餐", style: Theme.of(context).textTheme.display3),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.menu),
                  title: Text("筛选", style: Theme.of(context).textTheme.display3),
                  onTap: () {
                    Navigator.of(context).pop();
                    Future.delayed(Duration(milliseconds: 300), () {
                      Navigator.pushNamed(context, JPFilterPage.route);
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MainData {

  static BuildContext context;

  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      title: Text(S.of(context).tabBarHome),
      icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
      title: Text(S.of(context).tabBarFavor),
      icon: Icon(Icons.favorite)
    ),
    BottomNavigationBarItem(
      title: Text(S.of(context).tabBarProfile),
      icon: Icon(Icons.assignment_ind)
    )
  ];

  static List<Widget> pages = [
    JPHomePage(),
    JPFavorPage(),
    JPProfilePage()
  ];

}

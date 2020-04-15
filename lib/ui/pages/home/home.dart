import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/category_model.dart';
import 'package:flutter_demo_app/core/service/meal_request.dart';
import 'package:flutter_demo_app/ui/pages/home/home_item.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';

class JPHomePage extends StatefulWidget {

  static const String route = "/home";

  @override
  _JPHomePageState createState() => _JPHomePageState();
}

class _JPHomePageState extends State<JPHomePage> {

  List<JPCategoryModel> _categoryModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    JPMealRequest.categoryData().then((res) {
      setState(() {
        _categoryModels = res;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          }
        )
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(20.pt),
          itemCount: _categoryModels.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.pt,
            mainAxisSpacing: 20.pt,
            childAspectRatio: 1.5
          ),
          itemBuilder: (context, index) {
            final model = _categoryModels[index];
            return JPHomeItem(model);
          },
        ),
      )
    );
  }
}

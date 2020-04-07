import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/viewmodels/favor_view_model.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_item.dart';
import 'package:provider/provider.dart';

class JPFavorPage extends StatefulWidget {

  static const String route = "/home";

  @override
  _JPFavorPageState createState() => _JPFavorPageState();
}

class _JPFavorPageState extends State<JPFavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
        centerTitle: true,
      ),
      body: Consumer<JPMealFavorViewModel>(
        builder: (context, favorViewModel, index) {
          return ListView.builder(
            itemCount: favorViewModel.favorMeals.length,
            itemBuilder: (context, index) {
              return JPMealItem(favorViewModel.favorMeals[index]);
            },
          );
        },
      ),
    );
  }
}

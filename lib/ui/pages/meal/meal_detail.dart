import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';

class JPMealDetailPage extends StatefulWidget {

  static const String route = "/detail";

  @override
  _JPMealDetailPageState createState() => _JPMealDetailPageState();
}

class _JPMealDetailPageState extends State<JPMealDetailPage> {
  @override
  Widget build(BuildContext context) {

    final _mealModel = ModalRoute.of(context).settings.arguments as JPMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(_mealModel.title),
        centerTitle: true
      ),
      body: Container(
        child: Text(_mealModel.title),
      ),
    );
  }
}

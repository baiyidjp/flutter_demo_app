import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/category_model.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/viewmodels/meal_view_model.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_item.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class JPMealPage extends StatefulWidget {

  static const String route = "/meal";

  @override
  _JPMealPageState createState() => _JPMealPageState();
}

class _JPMealPageState extends State<JPMealPage> {

  @override
  Widget build(BuildContext context) {

    // 参数
    final categoryModel = ModalRoute.of(context).settings.arguments as JPCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
        centerTitle: true
      ),
      body: Selector<JPMealViewModel, List<JPMealModel>>(
        // 将泛型 A -> S
        selector: (context, mealViewModel) => mealViewModel.filterMeals.where((meal) => meal.categories.contains(categoryModel.id)).toList(),
        shouldRebuild: (pre, next) => !ListEquality().equals(pre, next),
        builder: (context, meals, child) {
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return JPMealItem(meals[index]);
            },
          );
        },
      )
    );
  }
}


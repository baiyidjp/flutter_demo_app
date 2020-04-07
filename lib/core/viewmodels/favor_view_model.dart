import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';

class JPMealFavorViewModel extends ChangeNotifier {

  List<JPMealModel> _favorMeals = [];

  List<JPMealModel> get favorMeals => _favorMeals;

  void _addMealToFavor(JPMealModel meal) {
    _favorMeals.add(meal);
  }

  void _deleteMealFromFavor(JPMealModel meal) {
    _favorMeals.remove(meal);
  }

  void handleMealInFavor(JPMealModel meal) {
    if (isMealInFavor(meal))  {
      _deleteMealFromFavor(meal);
    } else {
      _addMealToFavor(meal);
    }
    notifyListeners();
  }

  bool isMealInFavor(JPMealModel meal) {
    return _favorMeals.contains(meal);
  }
}
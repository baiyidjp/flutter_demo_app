import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/viewmodels/base_view_model.dart';

class JPMealFavorViewModel extends JPMealBaseViewModel {

  void _addMealToFavor(JPMealModel meal) {
    meals.add(meal);
  }

  void _deleteMealFromFavor(JPMealModel meal) {
    meals.remove(meal);
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
    return meals.contains(meal);
  }
}
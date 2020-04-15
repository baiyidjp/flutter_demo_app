import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'filter_view_model.dart';

class JPMealBaseViewModel extends ChangeNotifier {

  List<JPMealModel> _meals = [];

  JPFilterViewModel _filterViewModel;

  void update(JPFilterViewModel filterViewModel) {
    _filterViewModel = filterViewModel;
  }

  /*
  * isGlutenFree 五谷蛋白
  * isLactoseFree 不含乳糖
  * isVegan 素食主义
  * isVegetarian 严格素食主义
  * */
  List<JPMealModel> get filterMeals {

    final filterData = _filterViewModel.filterData;
    if (filterData.length != 4) { return []; }
    final isGlutenFree = filterData[0].isSelected;
    final isLactoseFree = filterData[1].isSelected;
    final isVegan = filterData[2].isSelected;
    final isVegetarian = filterData[3].isSelected;

    return _meals.where((mealViewModel) {
      if (isGlutenFree && !mealViewModel.isGlutenFree) return false;
      if (isLactoseFree && !mealViewModel.isLactoseFree) return false;
      if (isVegan && !mealViewModel.isVegan) return false;
      if (isVegetarian && !mealViewModel.isVegetarian) return false;
      return true;
    }).toList();
  }

  List<JPMealModel> get meals => _meals;

  set meals(List<JPMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/service/meal_request.dart';

class JPMealViewModel extends ChangeNotifier {

  List<JPMealModel> _meals = [];

  List<JPMealModel> get meals => _meals;

  JPMealViewModel() {

    JPMealRequest.mealData().then((res) {
      _meals = res;
      notifyListeners();
    });
  }
}
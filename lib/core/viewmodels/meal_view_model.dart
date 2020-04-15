import 'package:flutter_demo_app/core/service/meal_request.dart';
import 'package:flutter_demo_app/core/viewmodels/base_view_model.dart';

class JPMealViewModel extends JPMealBaseViewModel {


  JPMealViewModel() {

    JPMealRequest.mealData().then((res) {
      meals = res;
    });
  }
}
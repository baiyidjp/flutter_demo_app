import 'package:flutter_demo_app/core/models/category_model.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/service/http_request.dart';

class JPMealRequest {

  static Future<List<JPCategoryModel>> categoryData() async {

    final result = await HttpRequest.request("/category");

    // 取出数据
    final categories = result["category"];

    // 转成模型数据
    List<JPCategoryModel> models = [];
    for (var json in categories) {
      final model = JPCategoryModel.fromJson(json);
      models.add(model);
    }

    return models;

  }

  static Future<List<JPMealModel>> mealData() async {

    final result = await HttpRequest.request("/meal");

    final meals = result["meal"];

    List<JPMealModel> models = [];
    for (var json in meals) {
      final model = JPMealModel.fromJson(json);
      models.add(model);
    }

    return models;
  }
}
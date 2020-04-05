import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/core/models/category_model.dart';

class JsonParse  {

  static Future<List<JPCategoryModel>> categoryModels() async {

    // 加载json文件
    final jsonString  = await rootBundle.loadString("assets/json/category.json");

    // json 转 map/list
    final data = json.decode(jsonString);

    // 取出数据
    final categorys = data["category"];

    // 转成模型数据
    List<JPCategoryModel> models = [];
    for (var json in categorys) {
      final model = JPCategoryModel.fromJson(json);
      models.add(model);
    }

    return models;

  }
}
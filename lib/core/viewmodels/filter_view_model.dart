import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/filter_model.dart';

class JPFilterViewModel extends ChangeNotifier {

  List<JPFilterModel> _filterData = [];

  List<JPFilterModel> get filterData => _filterData;

  set filterData(List<JPFilterModel> value) {
    _filterData = value;
    notifyListeners();
  }

  JPFilterViewModel() {

    JPFilterModel model0 = JPFilterModel("五谷蛋白", "五谷蛋白的简介", false);
    JPFilterModel model1 = JPFilterModel("不含乳糖", "不含乳糖的简介", false);
    JPFilterModel model2 = JPFilterModel("素食主义", "素食主义的简介", false);
    JPFilterModel model3 = JPFilterModel("严格素食主义", "严格素食主义的简介", false);
    _filterData = [model0, model1, model2, model3];
  }
}
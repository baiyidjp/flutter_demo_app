import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_app/core/util/util.dart';

class JPCategoryModel {
  String id;
  String title;
  String color;
  Color showColor;

  JPCategoryModel({this.id, this.title, this.color});

  JPCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    showColor = Util.colorWithHexString(color);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}

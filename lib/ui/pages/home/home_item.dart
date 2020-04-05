import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/category_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';

class JPHomeItem extends StatelessWidget {

  final JPCategoryModel categoryModel;

  JPHomeItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.showColor,
          borderRadius: BorderRadius.circular(10.pt),
          gradient: LinearGradient(
              colors: [
                categoryModel.showColor.withOpacity(0.5),
                categoryModel.showColor
              ]
          )
      ),
      alignment: Alignment.center,
      child: Text(
          categoryModel.title,
          style: Theme.of(context).textTheme.display3.copyWith(
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}

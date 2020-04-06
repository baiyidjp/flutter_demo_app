import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/category_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_page.dart';

class JPHomeItem extends StatelessWidget {

  final JPCategoryModel _categoryModel;

  JPHomeItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: _categoryModel.showColor,
            borderRadius: BorderRadius.circular(10.pt),
            gradient: LinearGradient(
                colors: [
                  _categoryModel.showColor.withOpacity(0.5),
                  _categoryModel.showColor
                ]
            )
        ),
        alignment: Alignment.center,
        child: Text(
            _categoryModel.title,
            style: Theme.of(context).textTheme.display3.copyWith(
                fontWeight: FontWeight.bold
            )
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, JPMealPage.route, arguments: _categoryModel);
      },
    );
  }
}

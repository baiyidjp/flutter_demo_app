import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_detail.dart';

class JPMealItem extends StatelessWidget {

  final JPMealModel _mealModel;

  JPMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          children: <Widget>[
            imageInfoWidget(context),
            operationWidget()
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, JPMealDetailPage.route, arguments: _mealModel);
      },
    );
  }

  /* 图片的整体widget */
  Widget imageInfoWidget(BuildContext context) {
    return Stack(
//            alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        imageWidget(),
        imageTextWidget(context)
      ],
    );
  }

  /* 图片的widget */
  Widget imageWidget() {
    return Container(
      width: double.infinity,
      height: 250.pt,
      padding: EdgeInsets.all(8.pt),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.pt),
            topRight: Radius.circular(10.pt)
        ),
        child: FadeInImage(
          placeholder: AssetImage("assets/images/meal_default.png"),
          image: NetworkImage(_mealModel.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /* 图片上文字的widget */
  Widget imageTextWidget(BuildContext context) {
    return Positioned(
      left: 50.pt,
      right: 50.pt,
//                width: 200.pt,
      bottom: 20.pt,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.pt),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4.pt)
        ),
        child: Text(_mealModel.title, style: Theme.of(context).textTheme.display3.copyWith(
            color: Colors.white
        ),),
      )
    );
  }

  /* item底部的widget */
  Widget operationWidget() {
    return Container(
      height: 44.pt,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MealItemOperation(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          MealItemOperation(Icon(Icons.restaurant), "${_mealModel.complexString}"),
          MealItemOperation(Icon(Icons.favorite), "未收藏")
        ],
      ),
    );
  }
}

class MealItemOperation extends StatelessWidget {

  final Icon _icon;
  final String _title;

  MealItemOperation(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _icon,
        SizedBox(width: 5.pt),
        Text(_title)
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';

class JPMealItem extends StatelessWidget {

  final JPMealModel _mealModel;

  JPMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
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
              ),
              Positioned(
                left: 100.pt,
                width: 200.pt,
                bottom: 20.pt,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8.pt),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Text(_mealModel.title, style: Theme.of(context).textTheme.display3.copyWith(
                    color: Colors.white
                  ),),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}

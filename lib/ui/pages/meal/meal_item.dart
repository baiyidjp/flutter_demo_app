import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/core/viewmodels/favor_view_model.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_detail.dart';
import 'package:provider/provider.dart';

BuildContext _context;

class JPMealItem extends StatelessWidget {

  final JPMealModel _mealModel;

  JPMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {

    _context = context;

    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8.pt),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.pt)
        ),
        child: Column(
          children: <Widget>[
            imageInfoWidget(),
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
  Widget imageInfoWidget() {
    return Stack(
//            alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        imageWidget(),
        imageTextWidget()
      ],
    );
  }

  /* 图片的widget */
  Widget imageWidget() {
    return Container(
      width: double.infinity,
      height: 250.pt,
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
  Widget imageTextWidget() {
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
        child: Text(_mealModel.title, style: Theme.of(_context).textTheme.display3.copyWith(
            color: Colors.white
        ),),
      )
    );
  }

  /* item底部的widget */
  Widget operationWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MealItemOperation(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          MealItemOperation(Icon(Icons.restaurant), "${_mealModel.complexString}"),
          Consumer<JPMealFavorViewModel>(
            builder: (context, favorViewModel, index) {
              final iconData = favorViewModel.isMealInFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
              final color = favorViewModel.isMealInFavor(_mealModel) ? Colors.red : Colors.black;
              final title = favorViewModel.isMealInFavor(_mealModel) ?  "已收藏" :  "未收藏";
              return MealItemOperation(Icon(iconData, color: color), title, handle: () {
               favorViewModel.handleMealInFavor(_mealModel);
              });
            },
          )
        ],
      ),
    );
  }
}

class MealItemOperation extends StatelessWidget {

  final Icon _icon;
  final String _title;
  final Function handle;

  MealItemOperation(this._icon, this._title, {this.handle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60.pt,
        width: 100.pt,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _icon,
            SizedBox(width: 5.pt),
            Text(_title)
          ],
        ),
      ),
      onTap: handle,
    );
  }
}


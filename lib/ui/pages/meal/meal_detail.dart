import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo_app/core/models/meal_model.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/core/viewmodels/favor_view_model.dart';
import 'package:provider/provider.dart';

BuildContext _context;

class JPMealDetailPage extends StatefulWidget {

  static const String route = "/detail";

  @override
  _JPMealDetailPageState createState() => _JPMealDetailPageState();
}

class _JPMealDetailPageState extends State<JPMealDetailPage> {
  @override
  Widget build(BuildContext context) {

    _context = context;
    final _mealModel = ModalRoute.of(context).settings.arguments as JPMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(_mealModel.title),
        centerTitle: true
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0: return headerImageWidget(_mealModel.imageUrl);
              case 1: return sectionTextWidget("制作材料");
              case 2: return materialListView(_mealModel.ingredients);
              case 3: return sectionTextWidget("制作步骤");
              case 4: return stepListView(_mealModel.steps);
            }
            return Text("待续");
          },
        )
      ),
      floatingActionButton: Consumer<JPMealFavorViewModel>(
        builder: (context, favorViewModel, index) {
          final iconData = favorViewModel.isMealInFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
          final color = favorViewModel.isMealInFavor(_mealModel) ? Colors.red : Colors.black;
          return FloatingActionButton(
            child: Icon(iconData, color: color),
            onPressed: () {
              favorViewModel.handleMealInFavor(_mealModel);
            },
          );
        },
      ),
    );
  }

  Widget headerImageWidget(String imageUrl) {
    return Container(
      child: FadeInImage(
        placeholder: AssetImage("assets/images/meal_default.png"),
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget sectionTextWidget(String title) {
    return Container(
      height: 50.pt,
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(_context).textTheme.display4.copyWith(fontWeight: FontWeight.w500)),
    );
  }

  Widget materialListView(List<String> ingredients) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.pt),
      padding: EdgeInsets.only(left: 10.pt, top: 10.pt, right:10.pt, bottom: 5.pt),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.pt)
      ),
      child: ListView.builder(
        /* 设置包裹ListView */
        shrinkWrap: true,
        /* 设置不滚动 */
        physics: NeverScrollableScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10.pt, top: 5.pt, bottom: 5.pt),
            margin: EdgeInsets.only(bottom: 5.pt),
            decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(4.pt)
            ),
            child: Text(ingredients[index], style: Theme.of(_context).textTheme.display2),
          );
        },

      ),
    );
  }

  Widget stepListView(List<String> steps) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.pt),
      padding: EdgeInsets.all(10.pt),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.pt)
      ),
      child: ListView.separated(
        /* 设置包裹ListView */
        shrinkWrap: true,
        /* 设置不滚动 */
        physics: NeverScrollableScrollPhysics(),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              CircleAvatar(
                child: Text("#$index", style: Theme.of(_context).textTheme.display2.copyWith(color: Colors.white)),
                backgroundColor: Colors.purple,
              ),
              SizedBox(width: 10.pt),
              Expanded(child: Text(steps[index], style: Theme.of(_context).textTheme.display2))
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Color.fromRGBO(0, 0, 0, 0.1));
        },

      ),
    );
  }
}

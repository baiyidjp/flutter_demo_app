import 'package:flutter_demo_app/core/viewmodels/favor_view_model.dart';
import 'package:flutter_demo_app/core/viewmodels/filter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_demo_app/core/viewmodels/meal_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => JPMealViewModel()),
  ChangeNotifierProvider(create: (context) => JPMealFavorViewModel()),
  ChangeNotifierProvider(create: (context) => JPFilterViewModel())
];
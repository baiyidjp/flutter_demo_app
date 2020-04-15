import 'package:flutter_demo_app/core/viewmodels/favor_view_model.dart';
import 'package:flutter_demo_app/core/viewmodels/filter_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_demo_app/core/viewmodels/meal_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => JPFilterViewModel()),
  // 让MealViewModel依赖FilterViewModel
  ChangeNotifierProxyProvider<JPFilterViewModel, JPMealViewModel>(
    create: (context) => JPMealViewModel(),
    update: (context, filterViewModel, mealViewModel) {
      mealViewModel.update(filterViewModel);
      return mealViewModel;
    },
  ),
  ChangeNotifierProxyProvider<JPFilterViewModel, JPMealFavorViewModel>(
    create: (context) => JPMealFavorViewModel(),
    update: (context, filterViewModel, mealFavorViewModel) {
      mealFavorViewModel.update(filterViewModel);
      return mealFavorViewModel;
    },
  )
];
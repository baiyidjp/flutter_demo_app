import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/core/router/router.dart';
import 'package:flutter_demo_app/core/viewmodels/app_providers.dart';
import 'package:flutter_demo_app/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 加载布局
    Layout.init();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "美食广场",
      // 主题
      theme: JPAppTheme.normalTheme,
      // 路由
      initialRoute: JPRoute.initRoute,
      routes: JPRoute.routes,
      onGenerateRoute: JPRoute.generateRoute,
      onUnknownRoute: JPRoute.unknownRoute,

    );
  }
}

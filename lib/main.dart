import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/core/router/router.dart';
import 'package:flutter_demo_app/core/viewmodels/app_providers.dart';
import 'package:flutter_demo_app/core/viewmodels/local_view_model.dart';
import 'package:flutter_demo_app/ui/pages/main/main_page.dart';
import 'package:flutter_demo_app/ui/shared/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

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
      title: "",
      // 主题
      theme: JPAppTheme.normalTheme,
      // 路由
      initialRoute: JPRoute.initRoute,
      routes: JPRoute.routes,
      onGenerateRoute: JPRoute.generateRoute,
      onUnknownRoute: JPRoute.unknownRoute,
      // 国际化
      localizationsDelegates: {
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate
      },
      // 当前支持的语言
      supportedLocales: S.delegate.supportedLocales,
      // 当前语言
      locale: Locale.fromSubtags(languageCode: 'zh')

    );
  }
}

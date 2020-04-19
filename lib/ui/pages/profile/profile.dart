import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/viewmodels/local_view_model.dart';
import 'package:flutter_demo_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class JPProfilePage extends StatefulWidget {
  @override
  _JPProfilePageState createState() => _JPProfilePageState();
}

class _JPProfilePageState extends State<JPProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profileTitle),
        centerTitle: true
      ),
      body: Container(
        child: Consumer<JPLocalViewModel>(
          builder: (context, localViewModel, index) {
            return RaisedButton(
              child: Text('切换语言 ${localViewModel.locale.languageCode}'),
              onPressed: () {
                if (Localizations.localeOf(context).languageCode.contains('en')) {
                  localViewModel.locale = Locale.fromSubtags(languageCode: 'zh');
                } else {
                  localViewModel.locale = Locale.fromSubtags(languageCode: 'en');
                }
              },
            );
          },
        ),
      ),
    );
  }
}

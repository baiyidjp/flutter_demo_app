import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/layout/layout.dart';
import 'package:flutter_demo_app/core/models/filter_model.dart';
import 'package:flutter_demo_app/core/viewmodels/filter_view_model.dart';
import 'package:provider/provider.dart';

class JPFilterPage extends StatefulWidget {

  static const String route = "/filter";

  @override
  _JPFilterPageState createState() => _JPFilterPageState();
}

class _JPFilterPageState extends State<JPFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("筛选好吃的"),
        centerTitle: true
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.pt),
              alignment: Alignment.center,
              child: Text('展示你的选择', style: Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Consumer<JPFilterViewModel>(
                builder: (context, filterViewModel, child) {
                  return ListView.builder(
                    itemCount: filterViewModel.filterData.length,
                    itemBuilder: (context, index) {
                      var models = filterViewModel.filterData;
                      var model = filterViewModel.filterData[index];
                      return ListTile(
                        title: Text(model.title),
                        subtitle: Text(model.subTitle),
                        trailing: Switch(
                          value: model.isSelected,
                          onChanged: (value) {
                            model.isSelected = !model.isSelected;
                            filterViewModel.filterData = models;
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        )
      ),
    );
  }
}

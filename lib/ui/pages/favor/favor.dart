import 'package:flutter/material.dart';

class JPFavorPage extends StatefulWidget {

  static const String route = "/home";

  @override
  _JPFavorPageState createState() => _JPFavorPageState();
}

class _JPFavorPageState extends State<JPFavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
        centerTitle: true,
      ),
      body: Text("收藏"),
    );
  }
}

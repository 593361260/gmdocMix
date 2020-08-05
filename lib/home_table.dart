import 'package:flutter/material.dart';

class HomeLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return HomeStateWidget();
  }
}

class HomeStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("home"),
    );
  }

//http://api.gmdoc.com/home?device=android




}

import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GroupStateWidget();
  }
}

class GroupStateWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GroupPageState();
  }
}

class _GroupPageState extends State<GroupStateWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("follow"),
    );
  }

}

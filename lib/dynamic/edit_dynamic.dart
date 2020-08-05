import 'package:flutter/material.dart';

class EditDynamic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EditDynamicWidget();
  }
}

class EditDynamicWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditDynamicState();
  }
}

class EditDynamicState extends State<EditDynamicWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Text("居中"),
      ),
    );
  }
}

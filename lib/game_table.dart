import 'package:flutter/material.dart';

class GameTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameTableDetails();
  }
}

class GameTableDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameListPage();
  }
}

class _GameListPage extends State<GameTableDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("game List"),
    );
  }
}

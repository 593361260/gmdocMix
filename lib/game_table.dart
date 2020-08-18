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

class _GameListPage extends State<GameTableDetails>
    with AutomaticKeepAliveClientMixin<GameTableDetails> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Text("game List"),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
}

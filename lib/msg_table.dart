import 'package:flutter/material.dart';

class MsgLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MsgFullWidget();
  }
}

class MsgFullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MsgState();
  }
}

class _MsgState extends State<MsgFullWidget>
    with AutomaticKeepAliveClientMixin<MsgFullWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Text("msg"),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
}

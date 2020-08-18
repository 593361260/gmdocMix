import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gmdoc/widget/custom_widget.dart';

import 'conponent/constant.dart';

/*class HomeLessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeStateWidget();
  }
}*/

class HomeStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeStateWidget>
    with AutomaticKeepAliveClientMixin<HomeStateWidget> {
  List data;
  var controller = ScrollController();

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    super.build(context);
    if (data == null) data = List();
    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: data.length == 0 ? _loading() : _getItem(),
        controller: controller,
      ),
    );
  }

  List<Widget> _loading() {
    getHotGame();
    return <Widget>[
      Center(
        child: Text(
          "正在加载",
          style: TextStyle(fontSize: 15, color: Color(0xff1fc199)),
        ),
      )
    ];
  }

  List<Widget> _getItem() {
    return data.map((f) {
     return GameTableDetailsWidget(data: f,);
    }).toList();
  }

//http://api.gmdoc.com/home?device=android
  /*
   * 获取主页热门游戏列表
   */
  getHotGame() async {
    var hc = HttpClient();
    var request = await hc.getUrl(Uri.parse("${API}home$REQUEST_SUFFIX"));
    var response = await request.close();
    var body = await response.transform(Utf8Decoder()).join();
    var result = json.decode(body);
    var gameList = result["data"]["game"]["data"];
    setState(() {
      for (var bean in gameList) {
        for (var child in bean) {
          data.add(child);
        }
      }
    });
  }

  //获取热门图片动态
  getHotDynamic(int page) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
}

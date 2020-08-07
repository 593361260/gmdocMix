import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'conponent/constant.dart';

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
    getHotGame();
    return Scaffold(
      body: Text("home"),
    );
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
    print(body);
  }
  //获取热门图片动态
  getHotDynamic(int page){

  }
}

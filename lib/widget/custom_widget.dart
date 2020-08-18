import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_block_text.dart';

/*
 * home game item details
 */
// ignore: must_be_immutable
class GameTableDetailsWidget extends StatefulWidget {
  final data; //传入的json对象

  const GameTableDetailsWidget({Key key, this.data}) : super(key: key);

  pressJump(id) {}

  @override
  State<StatefulWidget> createState() {
    return GameTableDetailsState(bean: data);
  }
}

class GameTableDetailsState extends State<GameTableDetailsWidget> {
  final bean;

  GameTableDetailsState({Key key, this.bean});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 113,
                width: 92,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(bean["cover"]), fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              ),
              Wrap(children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(bean["score"]),
                  ],
                ),
                CustomPaint(
                    painter: CustomBoardState(score: "8"),
                ),
                Text("评分"),
              ], direction: Axis.horizontal)
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Row(
            //底部发布时间等信息
            children: <Widget>[
              Image(
                image: AssetImage("icon/img_time_grey.png"),
                width: 12,
                height: 12,
              ),
              Text(
                bean["sale_time"],
                style: TextStyle(fontSize: 11, color: Color(0xff888888)),
              ),
              Text(bean["version"],
                  style: TextStyle(fontSize: 11, color: Color(0xff888888))),
//              Text(bean["extra"],
//                  style: TextStyle(fontSize: 11, color: Color(0xff888888))),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
      onTap: () {
        print("点击一下");
      },
    );
  }
}

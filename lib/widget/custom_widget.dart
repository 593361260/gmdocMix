import 'package:flutter/cupertino.dart';

/*
 * home game item details
 */
// ignore: must_be_immutable
class GameTableDetails extends StatelessWidget {
  var data; //传入的json对象

  GameTableDetails({Key key, this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Container(


          ),
        ],
      ),
      onTap: () {},
    );
  }

  pressJump(id) {}
}

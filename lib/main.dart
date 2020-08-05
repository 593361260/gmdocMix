import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dynamic/edit_dynamic.dart';
import 'game_table.dart';
import 'group_table.dart';
import 'home_table.dart';
import 'msg_table.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '游戏档案',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pageControl = PageController(keepPage: false);
  var _currentIndex = 0;
  var homeResource = "icon/btn_home_selected.png";
  var gameResource = "icon/btn_game.png";
  var groupResource = "icon/btn_group.png";
  var msgResource = "icon/btn_ring.png";

  @override
  void setState(fn) {
    if (_currentIndex != 0) {
      homeResource = "icon/btn_home.png";
    } else
      homeResource = "icon/btn_home_selected.png";
    if (_currentIndex != 1) {
      gameResource = "icon/btn_game.png";
    } else
      gameResource = "icon/btn_game_selected.png";
    if (_currentIndex != 2) {
      groupResource = "icon/btn_group.png";
    } else
      groupResource = "icon/btn_group_selected.png";
    if (_currentIndex != 3) {
      msgResource = "icon/btn_ring.png";
    } else
      msgResource = "icon/btn_ring_selected.png";
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildNormal() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageControl,
        children: <Widget>[
          HomeLessWidget(),
          GameTablePage(),
          GroupWidget(),
          MsgLessWidget()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image(
              image: AssetImage("icon/btn_home.png"),
              width: 24,
              height: 24,
            ),
            activeIcon: Image(
              image: AssetImage("icon/btn_home_selected.png"),
              width: 24,
              height: 24,
            ),
            title: Text("主页", style: TextStyle(color: Color(0xff666666))),
          ),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("icon/btn_game.png"),
                width: 24,
                height: 24,
              ),
              activeIcon: Image(
                image: AssetImage("icon/btn_game_selected.png"),
                width: 24,
                height: 24,
              ),
              title: Text("游戏库", style: TextStyle(color: Color(0xff666666)))),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("icon/btn_group.png"),
                width: 24,
                height: 24,
              ),
              activeIcon: Image(
                image: AssetImage("icon/btn_group_selected.png"),
                width: 24,
                height: 24,
              ),
              title: Text("关注圈", style: TextStyle(color: Color(0xff666666)))),
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("icon/btn_ring.png"),
                width: 24,
                height: 24,
              ),
              activeIcon: Image(
                image: AssetImage("icon/btn_ring_selected.png"),
                width: 24,
                height: 24,
              ),
              title: Text("消息", style: TextStyle(color: Color(0xff666666))))
        ],
        onTap: (index) {
          _pageControl.jumpToPage(index);
        },
        currentIndex: _currentIndex,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
      ),
    );
  }

  Widget _buildBody() {
    return Scaffold(
        body: PageView(
          controller: _pageControl,
          children: <Widget>[
            HomeLessWidget(),
            GameTablePage(),
            GroupWidget(),
            MsgLessWidget()
          ],
          onPageChanged: (index) {
            _currentIndex = index;
            setState(() {
            });
          },
//          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: _buildChile(),
          shape: CircularNotchedRectangle(),
          color: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return  EditDynamic();
            }));
          },
          child: Image.asset("icon/btn_create_post.png"),
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget _buildChile() {
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: 50,
              child: Column(
                children: <Widget>[
                  Image(image: AssetImage(homeResource), width: 24, height: 24),
                  Container(
                    child: Text(
                      "主页",
                      style: TextStyle(color: Color(0xff666666), fontSize: 10),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
              ),
            ),
            onTap: () {
              if (_currentIndex != 0) {
                _currentIndex = 0;
                _pageControl.jumpToPage(_currentIndex);
                setState(() {});
              }
            },
          ),
          GestureDetector(
            child: Container(
              width: 50,
              child: Column(
                children: <Widget>[
                  Image.asset(gameResource, width: 24, height: 24),
                  Container(
                    child: Text(
                      "游戏库",
                      style: TextStyle(color: Color(0xff666666), fontSize: 10),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            ),
            onTap: () {
              if (_currentIndex != 1) {
                _currentIndex = 1;
                _pageControl.jumpToPage(_currentIndex);
                setState(() {});
              }
            },
          ),
          GestureDetector(
            child: Container(
              width: 50,
              child: Column(
                children: <Widget>[
                  Image.asset(groupResource, width: 24, height: 24),
                  Container(
                    child: Text(
                      "关注圈",
                      style: TextStyle(color: Color(0xff666666), fontSize: 10),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            ),
            onTap: () {
              if (_currentIndex != 2) {
                _currentIndex = 2;
                _pageControl.jumpToPage(_currentIndex);
                setState(() {});
              }
            },
          ),
          GestureDetector(
            child: Container(
              width: 50,
              child: Column(
                children: <Widget>[
                  Image.asset(msgResource, width: 24, height: 24),
                  Container(
                    child: Text(
                      "消息",
                      style: TextStyle(color: Color(0xff666666), fontSize: 10),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            onTap: () {
              if (_currentIndex != 3) {
                _currentIndex = 3;
                _pageControl.jumpToPage(_currentIndex);
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}

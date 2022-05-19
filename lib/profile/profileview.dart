import 'stacklayer.dart';
import 'following_match.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  @override
  Widget build(BuildContext context) {
    // return iconList;
    return profileScaffold;
  }
}

final profileScaffold = Scaffold(
  body: Column(
    children: <Widget>[
      const SizedBox(
        height: 69,
      ),
      stacklayer,
      const SizedBox(height: 30,),
      const SizedBox(
        height: 29, width: 320,
        child: Text("我的追蹤", textAlign: TextAlign.left,),
      ),
      SizedBox(
        child: following_match,
      ),
      const SizedBox(height: 27,),
    ]
  ),

  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  floatingActionButton: const AddFollowingButton(),

  // 這裡要放NavigationBar
  // 暫時用簡易版
  bottomNavigationBar: BottomAppBar(
    color: Colors.yellow,
    child: Container(height: 50,)
  ),

);

final following_team = Row(
  children: <Widget>[
    const SizedBox(width: 24,),
    Neumorphic(
      style: const NeumorphicStyle(
        shape: NeumorphicShape.concave,
          // boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)), 
          depth: 8,
          lightSource: LightSource.topLeft,
          color: Colors.white10
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 38,),
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.purple[200],
          ),
          const SizedBox(width: 33.1,),
          SizedBox(
            width: 146,
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NeumorphicText(
                  "目前無追蹤球隊",
                  style: NeumorphicStyle(
                    color: Colors.purple[300],
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 20,
                  ),
                ),
                NeumorphicText(
                  "請點擊右方小鈴鐺追蹤比賽",
                  style: NeumorphicStyle(
                    color: Colors.purple[300],
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 50,),
          SizedBox(
            child: IconButton(
              onPressed: nothing,
              icon: Transform.rotate(
                angle: 0.5,
                child: Icon(Icons.notifications_none_rounded,
                  size: 20,
                  color: Colors.purple[300],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(width: 24,),
  ],
  )
);

nothing() {
  print("toggle");
}
String user_name = "我的名字";
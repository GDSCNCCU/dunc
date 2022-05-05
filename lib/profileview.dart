import './main.dart';

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
    return tmp;
  }
}

final tmp = Scaffold(
  body: Column(
    children: <Widget>[
      const SizedBox(
        height: 69,
      ),
      Stack(
        children: <Widget>[
          Row(
            children : <Widget> [
              const SizedBox(width: 28),
              SizedBox(
                width: 97,
                height: 97,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  // color: Colors.amber,
                ),
              ),
              const SizedBox(width: 23,),
              SizedBox(
                height: 97,
                width: 149,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 23),
                    Container(
                      height: 40,
                      child: const Text(
                        "中文系", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      height: 18,
                      child: Text("user id = $user_id",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 40,),
              const SizedBox(
                child: IconButton(onPressed: nothing, icon: Icon(Icons.arrow_forward_ios_rounded))
              )
            ]
          ),
          Row(
            children: <Widget>[
              const SizedBox(width: 28,),
              SizedBox(
                width: 97, height: 97,
                child: Visibility(
                  visible: false,
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: const Icon(Icons.circle),onPressed: nothing, color: Colors.purple[300],
                    iconSize: 55,
                  ),
                )
              ),
            ],
          )
        ],
      ),
      const SizedBox(height: 30,),
      SizedBox(
        child: following_team,
      ),
      const SizedBox(height: 27,),
    ]
  )
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
);

nothing() {
  print("toggle");
}
String user_id = "12345678";

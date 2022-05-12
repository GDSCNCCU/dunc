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
  )
);

nothing() {
  print("toggle");
}
String user_name = "我的名字";
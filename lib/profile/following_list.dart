import 'package:dunc/profile/profileview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../tools/colors.dart';


class FollowingList extends StatefulWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final List<bool> _selection1 = [true];
  final List<bool> _selection2 = [false];
  int _selected = 0;

  final List<Text> _followintTeam = [];
  final List<Text> _followingPlayer = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Row(
              children: [
                const SizedBox(width: 32,),
                // 用兩個ToggleButton + SizedBox實現兩個按鈕間的空格
                // Team
                SizedBox(
                  width: 53,
                  height: 20,
                  child: ToggleButtons(
                    children: <Widget>[
                      const Text('Team'),
                    ],
                    isSelected: _selection1,
                    onPressed: (index) {
                      if (!_selection1[0]) {
                        setState(() {
                          _selection1[0] = true;
                          _selection2[0] = false;
                          _selected = 0;
                        });
                      }
                    },
                    color: secondPurple,
                    selectedColor: Colors.white,
                    fillColor: secondPurple,
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: secondPurple,
                    borderColor: secondPurple,
                    borderWidth: 2,
                  ),
                ),

                const SizedBox(width: 14,),

                // Player
                SizedBox(
                  width: 53,
                  height: 20,
                  child: ToggleButtons(
                    children: <Widget>[
                      const Text('Player'),
                    ],
                    isSelected: _selection2,
                    onPressed: (index) {
                      if (!_selection2[0]) {
                        setState(() {
                          _selection2[0] = true;
                          _selection1[0] = false;
                          _selected = 1;
                        });
                      }
                    },
                    color: secondPurple,
                    selectedColor: Colors.white,
                    fillColor: secondPurple,
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: secondPurple,
                    borderColor: secondPurple,
                    borderWidth: 2,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                // 編輯
                SizedBox(
                  width: 45,
                  height: 35,
                  child: TextButton(
                    child: const Text('編輯', 
                      style: TextStyle(color: Color.fromARGB(255, 62, 62, 62)),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 37,),
              ]
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 25,),
        Row(
          children: <Widget>[
            SizedBox(width: 37,),
            (_selected == 0) ?
            const Text('我的追蹤球隊',
                    style: TextStyle(fontSize: 20),
                  ) : 
            const Text('我的追蹤球員',
                    style: TextStyle(fontSize: 20),
                  ),
          ]
        ),
        SizedBox(height: 34,),
        Center(child: (_selected == 0) ? teamList(_followintTeam) : playerList(_followingPlayer),)
      ],
    );
  }
}

teamList(followintTeam) {
  if (followintTeam.length == 0) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: purple,
            size: 100,
          ),
          Text(
            '目前無追蹤球隊',
            style: TextStyle(color: purple, fontSize: 36),
          )
        ],
      ),
    );
  }
}

playerList(followingPlayer) {
  if (followingPlayer.length == 0) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: purple,
            size: 100,
          ),
          Text(
            '目前無追蹤球員',
            style: TextStyle(color: purple, fontSize: 36),
          )
        ],
      ),
    );
  } 
}
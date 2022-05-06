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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            const SizedBox(width: 24,),
            // 用兩個ToggleButton + SizedBox實現兩個按鈕間的空格
            // Team
            SizedBox(
              width: 53,
              height: 20,
              child: ToggleButtons(
                children: [
                  Text('Team'),
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

            SizedBox(width: 14,),

            // Player
            SizedBox(
              width: 53,
              height: 20,
              child: ToggleButtons(
                children: [
                  Text('Player'),
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
      ],
    );
  }
}
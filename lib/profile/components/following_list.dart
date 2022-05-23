import 'package:dunc/profile/components/following_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:dunc/tools/gradient_text.dart';
import '../../tools/colors.dart';
import './empty_following_list.dart';
import './following_team.dart';


class FollowingList extends StatefulWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final List<bool> _selection = [false, false];

  final List<String> _followingTeam = [
    '中文系',
    '廣電系',
    '地政系',
    '廣告系',
    '資科系',
    '資管系'
  ];

  final List<List<String>> _followingPlayer = [
    [
      '資科系',
      '74',
      '亞洲董神'
    ],
    [
      '糖豆系',
      '7',
      '力量人'
    ],
    [
      '中文系',
      '10',
      '王小明'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 14,),
        Row(
          children: <Widget>[
            Row(
              children: [
                const SizedBox(width: 31,),

                // 球隊Button
                Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 6,
                    top: 0,
                    bottom: 0,
                  ),
                  width: (_selection[0]) ? 66 : 52,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(31),
                    ),
                    gradient: LinearGradient(
                      colors: (_selection[0]) ?
                        [DuncColors.mainCTAFrom, DuncColors.mainCTATo] :
                        [Colors.white, Colors.white],
                    ),
                    border: Border.all(
                      color: DuncColors.mainCTAFrom,
                      width: 1
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_selection[0]) {
                        _selection[0] = false;
                      } else {
                        _selection[0] = true;
                      }
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0), 
                    ),
                    child: (_selection[0]) ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            '球隊',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Noto Sans TC',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ) : 
                      const GradientText(
                        '球隊',
                        gradient: LinearGradient(
                          colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                        ),
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Noto Sans TC',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ),
                ),

                const SizedBox(width: 14,),

                // 球員Button
                Container(
                  padding: const EdgeInsets.only(
                    left: 6,
                    right: 6,
                    top: 0,
                    bottom: 0,
                  ),
                  width: (_selection[1]) ? 66 : 52,
                  height: 23,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(11.5),
                    ),
                    gradient: LinearGradient(
                      colors: (_selection[1]) ?
                        [DuncColors.mainCTAFrom, DuncColors.mainCTATo] :
                        [Colors.white, Colors.white],
                    ),
                    border: Border.all(
                      color: DuncColors.mainCTAFrom,
                      width: 1
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_selection[1]) {
                        _selection[1] = false;
                      } else {
                        _selection[1] = true;
                      }
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0), 
                    ),
                    child: (_selection[1]) ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            '球員',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Noto Sans TC',
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ) : 
                      const GradientText(
                        '球員',
                        gradient: LinearGradient(
                          colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                        ),
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Noto Sans TC',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                // 編輯
                SizedBox(
                  width: 50,
                  height: 35,
                  child: TextButton(
                    child: const Text(
                      '編輯', 
                      style: TextStyle(
                        color: DuncColors.indicatorImportant,
                        fontSize: 15,
                        fontFamily: 'Noto Sans TC'
                      ),
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

        (!_selection[0] && !_selection[1]) ? 
        const EmptyFollowingList() : 

        (_selection[0] && !_selection[1]) ?
        Column(
          children: List<Widget>.generate(_followingTeam.length,
            (index) => Column(
              children: <Widget>[
                FollowingTeam(_followingTeam[index]),
                const SizedBox(height: 17,),
              ],
            )
          ),
        ) : 
        Column(
          children: List<Widget>.generate(_followingPlayer.length,
            (index) => Column(
              children: <Widget>[
                FollowingPlayer(
                  department: _followingPlayer[index][0],
                  num: _followingPlayer[index][1],
                  name: _followingPlayer[index][2],
                ),
                const SizedBox(height: 17,),
              ],
            )
          ),
        ),
      ],
    );
  }
}

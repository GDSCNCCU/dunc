import 'package:dunc/tools/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../tools/colors.dart';


class FollowingList extends StatefulWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  final List<bool> _selection = [false, false];

  final List<Text> _followintTeam = [];
  final List<Text> _followingPlayer = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 14,),
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
                        color: Color.fromARGB(255, 62, 62, 62),
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
      ],
    );
  }
}

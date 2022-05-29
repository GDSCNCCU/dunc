import 'package:flutter/material.dart';
import 'package:dunc/search_page/game_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'example_match.dart';
import '/tools/colors.dart';


class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  final List<bool> _selection1 = [true];
  final List<bool> _selection2 = [false];
  final List<bool> _selection3 = [false];
  final List<bool> _selection4 = [false];
  int _selected = 0;

  final List<List> games = [[exampleMatch, exampleMatch2, exampleMatch3, exampleMatch4, exampleMatch5, exampleMatch6, exampleMatch7, exampleMatch8, exampleMatch9, exampleMatch10, exampleMatch11, exampleMatch12, exampleMatch13, exampleMatch14, exampleMatch15],
                            [exampleMatch2, exampleMatch4, exampleMatch8, exampleMatch9, exampleMatch10],
                            [exampleMatch, exampleMatch3, exampleMatch6, exampleMatch7, exampleMatch11, exampleMatch12, exampleMatch13, exampleMatch14, exampleMatch15],
                            [exampleMatch5]
                          ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Row(
              children: [
                const SizedBox(width: 32,),
                SizedBox(
                  width: 53,
                  height: 23,
                  child: ToggleButtons(
                    children: const <Widget>[
                      Text('全部', style: TextStyle(fontSize: 14, fontFamily: 'Lexend'),),
                    ],
                    isSelected: _selection1,
                    onPressed: (index) {
                      if (!_selection1[0]) {
                        setState(() {
                          _selection1[0] = true;
                          _selection2[0] = false;
                          _selection3[0] = false;
                          _selection4[0] = false;
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
                // 用兩個ToggleButton + SizedBox實現兩個按鈕間的空格
                // Team
                SizedBox(
                  width: 53,
                  height: 23,
                  child: ToggleButtons(
                    children: const <Widget>[
                      Text('季後賽', style: TextStyle(fontSize: 14, fontFamily: 'Lexend'),),
                    ],
                    isSelected: _selection2,
                    onPressed: (index) {
                      if (!_selection2[0]) {
                        setState(() {
                          _selection1[0] = false;
                          _selection2[0] = true;
                          _selection3[0] = false;
                          _selection4[0] = false;
                          _selected = 1;
                        });
                      }
                    },
                    color: DuncColors.playoffs,
                    selectedColor: Colors.white,
                    fillColor: DuncColors.playoffs,
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: DuncColors.playoffs,
                    borderColor: DuncColors.playoffs,
                    borderWidth: 2,
                  ),
                ),

                const SizedBox(width: 14,),

                // Player
                SizedBox(
                  width: 53,
                  height: 23,
                  child: ToggleButtons(
                    children: const <Widget>[
                      Text('積分賽', style: TextStyle(fontSize: 14, fontFamily: 'Lexend'),),
                    ],
                    isSelected: _selection3,
                    onPressed: (index) {
                      if (!_selection3[0]) {
                        setState(() {
                          _selection1[0] = false;
                          _selection2[0] = false;
                          _selection3[0] = true;
                          _selection4[0] = false;
                          _selected = 2;

                        });
                      }
                    },
                    color: DuncColors.pointsMatch,
                    selectedColor: Colors.white,
                    fillColor: DuncColors.pointsMatch,
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: DuncColors.pointsMatch,
                    borderColor: DuncColors.pointsMatch,
                    borderWidth: 2,
                  ),
                ),
                const SizedBox(width: 14,),

                // Player
                SizedBox(
                  width: 53,
                  height: 23,
                  child: ToggleButtons(
                    children: const <Widget>[
                      Text('明星賽', style: TextStyle(fontSize: 14, fontFamily: 'Lexend'),),
                    ],
                    isSelected: _selection4,
                    onPressed: (index) {
                      if (!_selection4[0]) {
                        setState(() {
                          _selection1[0] = false;
                          _selection2[0] = false;
                          _selection3[0] = false;
                          _selection4[0] = true;
                          _selected = 3;
                        });
                      }
                    },
                    color: DuncColors.allStar,
                    selectedColor: Colors.white,
                    fillColor: DuncColors.allStar,
                    borderRadius: BorderRadius.circular(10),
                    selectedBorderColor: DuncColors.allStar,
                    borderColor: DuncColors.allStar,
                    borderWidth: 2,
                  ),
                )
              ],
            ),
            
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        const SizedBox(height: 25,),

        Center(child: showtype(_selected, games[_selected])),
      ],
    );
  }
}

Widget showtype(int selected, followingame){
  if(selected == 0){
    return AllgameList(followingame);
  }
  else if(selected == 1){
    return PlayoffList(followingame);
  }
  else if(selected == 2){
    return RankList(followingame);
  }
  else if(selected == 3){
    return AllstarList(followingame);
  }
  return const SizedBox(height: 0, width: 0,);
}


AllgameList(followingMatch) {
  if (followingMatch.length == 0) {
    return Center(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 187, 155, 204),
            size: 100,
          ),
          Text(
            '目前無比賽',
            style: TextStyle(
              color: Color.fromARGB(255, 187, 155, 204), 
              fontSize: 36,
              fontFamily: 'Noto Sans TC',
              fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
  else{
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: const [SizedBox(width: 40),Text("時間"),SizedBox(width: 50,), Text("類別"), SizedBox(width: 160,),Text("提醒")],),
      SizedBox(
        height: 420,
        child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: followingMatch.length,
        itemBuilder: (context, index){
          return GameCard2(gameDate: followingMatch[index].date, gameType: followingMatch[index].matchType, guestTeam: followingMatch[index].team1, homeTeam: followingMatch[index].team2, gameColor: "orange");
        }
        ),),
    ],);
  }
}

PlayoffList(followingMatch) {
  if (followingMatch.length == 0) {
    return Center(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 187, 155, 204),
            size: 100,
          ),
          Text(
            '目前無季後賽',
            style: TextStyle(
              color: Color.fromARGB(255, 187, 155, 204), 
              fontSize: 36,
              fontFamily: 'Noto Sans TC',
              fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
  else{
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[SizedBox(width: 40),Text("時間"),SizedBox(width: 50,), Text("類別"), SizedBox(width: 160,),Text("提醒")],),
      SizedBox(
        height: 420,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
        itemCount: followingMatch.length,
        itemBuilder: (context, index){
          return GameCard2(gameDate: followingMatch[index].date, gameType: followingMatch[index].matchType, guestTeam: followingMatch[index].team1, homeTeam: followingMatch[index].team2, gameColor: "orange");
        }
        ),),
    ],);
  }
}

RankList(followingMatch) {
  if (followingMatch.length == 0) {
    return Center(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 187, 155, 204),
            size: 100,
          ),
          Text(
            '目前無積分賽',
            style: TextStyle(
              color: Color.fromARGB(255, 187, 155, 204), 
              fontSize: 36,
              fontFamily: 'Noto Sans TC',
              fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  } 
  else{
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[SizedBox(width: 40),Text("時間"),SizedBox(width: 50,), Text("類別"), SizedBox(width: 160,),Text("提醒")],),
     SizedBox(
        height: 420,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
        itemCount: followingMatch.length,
        itemBuilder: (context, index){
          return GameCard2(gameDate: followingMatch[index].date, gameType: followingMatch[index].matchType, guestTeam: followingMatch[index].team1, homeTeam: followingMatch[index].team2, gameColor: "orange");
        }
        ),),
    ],);
  }
}

AllstarList(followingMatch) {
  if (followingMatch.length == 0) {
    return Center(
      child: Column(
        children: const <Widget>[
          Icon(
            Icons.warning_amber_rounded,
            color: Color.fromARGB(255, 187, 155, 204),
            size: 100,
          ),
          Text(
            '目前無明星賽',
            style: TextStyle(
              color: Color.fromARGB(255, 187, 155, 204), 
              fontSize: 36,
              fontFamily: 'Noto Sans TC',
              fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  } 

  else{
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[SizedBox(width: 40),Text("時間"),SizedBox(width: 50,), Text("類別"), SizedBox(width: 160,),Text("提醒")],),
      SizedBox(
        height: 420,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
        itemCount: followingMatch.length,
        itemBuilder: (BuildContext context,int index){
          return GameCard2(gameDate: followingMatch[index].date, gameType: followingMatch[index].matchType, guestTeam: followingMatch[index].team1, homeTeam: followingMatch[index].team2, gameColor: "orange");
        }
        ),),
      
    ],);
  }
}


import '../tools/pair.dart';

enum MatchType{
  playoffs, // 季後賽
  allStar,  // 明星賽
  points,   // 積分賽
}

class Match{
  final String team1;
  final String team2;
  final String team1NickName; // summary中背景一個字
  final String team2NickName; // summary中背景一個字
  int score1; // 隊伍總分
  int score2; // 隊伍總分
  final DateTime date;  // can be initialized by date = DateTime(1314, 5, 20)
  final MatchType matchType;
  final String place;
  List<int>? quarterScore1;  // 各節比分
  List<int>? quarterScore2;  // 各節比分
  MatchTeamInfo? teamCmp1;  // 在summary裡
  MatchTeamInfo? teamCmp2;  // 在summary裡
  Set<PlayerInfo>? playerInfo1; // 跨summary與box score
  Set<PlayerInfo>? playerInfo2; // 跨summary與box score

  // just an initializer who gets them all
  Match({required this.team1, required this.team2, required this.team1NickName, required this.team2NickName, this.score1 = 0, this.score2 = 0, required this.date, required this.matchType, required this.place, this.quarterScore1, this.quarterScore2, this.teamCmp1, this.teamCmp2, this.playerInfo1, this.playerInfo2}){
    assert(team1NickName.length == 1);
    assert(team2NickName.length == 1);
    assert(score1 >= 0);
    assert(score2 >= 0);
  }
}

class MatchTeamInfo{
  _Fraction? shots;  // 投籃數
  _Fraction? triple; // 三分球
  _Fraction? penalty;  //罰球
// todo: Figma看不到下面還有什麼

  MatchTeamInfo({this.shots, this.triple, this.penalty});
}

class PlayerInfo{
  final String name;
  int fgma;
  final String team;
  int score;

  PlayerInfo({required this.name, this.fgma = 0, required this.team, this.score = 0}){
    assert(fgma >= 0);
    assert(score >= 0);
  }
}

class _Fraction extends Pair<int, int>{
  _Fraction(int molecular, int denominator) : super(molecular, denominator);
}
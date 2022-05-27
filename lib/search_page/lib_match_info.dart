import '../tools/pair.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';

enum MatchType{
  /// 季後賽
  playoffs,
  /// 明星賽
  allStar,
  /// 積分賽
  pointsMatch,
}

///一場比賽所有資訊
class Match{
  final String team1;
  final String team2;
  /// summary中背景一個字
  final String team1NickName;
  /// summary中背景一個字
  final String team2NickName;
  /// 隊伍總分
  int score1;
  /// 隊伍總分
  int score2;
  /// can be initialized by date = DateTime(1314, 5, 20)
  final DateTime date;
  final MatchType matchType;
  final String place;
  /// 各節比分
  List<int>? quarterScore1;
  /// 各節比分
  List<int>? quarterScore2;
  /// summary裡「兩隊比較」
  MatchTeamInfo? teamCmp2;
  /// summary裡「兩隊比較」
  MatchTeamInfo? teamCmp1;
  /// summary「最佳球員」、box score
  Set<PlayerInfo>? playerInfo2;
  /// summary「最佳球員」、box score
  Set<PlayerInfo>? playerInfo1;

  // just an initializer who gets them all
  ///一場比賽所有資訊
  Match({required this.team1, required this.team2, required this.team1NickName, required this.team2NickName, this.score1 = 0, this.score2 = 0, required this.date, required this.matchType, required this.place, this.quarterScore1, this.quarterScore2, this.teamCmp1, this.teamCmp2, this.playerInfo1, this.playerInfo2}){
    assert(team1.isNotEmpty);
    assert(team2.isNotEmpty);
    assert(team1NickName.length == 1);
    assert(team2NickName.length == 1);
    assert(score1 >= 0);
    assert(score2 >= 0);
    assert(place.isNotEmpty);
  }

  Pair<PlayerInfo?, PlayerInfo?> get maxScorePlayers{
    List<PlayerInfo?> ret = List.filled(2, null, growable: false);

    if(playerInfo1 != null){
      ret[0] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo1!){
        if(player.score >= ret[0]!.score){
          ret[0] = player;
        }
      }
    }

    if(playerInfo2 != null){
      ret[1] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo2!){
        if(player.score >= ret[1]!.score){
          ret[1] = player;
        }
      }
    }
    return Pair(ret[0], ret[1]);
  }

  Pair<PlayerInfo?, PlayerInfo?> get maxStealPlayers{
    List<PlayerInfo?> ret = List.filled(2, null, growable: false);

    if(playerInfo1 != null){
      ret[0] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo1!){
        if(player.steal >= ret[0]!.steal){
          ret[0] = player;
        }
      }
    }

    if(playerInfo2 != null){
      ret[1] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo2!){
        if(player.steal >= ret[1]!.steal){
          ret[1] = player;
        }
      }
    }
    return Pair(ret[0], ret[1]);
  }

  Pair<PlayerInfo?, PlayerInfo?> get maxReboundPlayers {
    List<PlayerInfo?> ret = List.filled(2, null, growable: false);

    if(playerInfo1 != null){
      ret[0] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo1!){
        if(player.rebound >= ret[0]!.rebound){
          ret[0] = player;
        }
      }
    }

    if(playerInfo2 != null){
      ret[1] = PlayerInfo(name: '?', number: 0, team: '?', isFormal: false);
      for(var player in playerInfo2!){
        if(player.rebound >= ret[1]!.rebound){
          ret[1] = player;
        }
      }
    }
    return Pair(ret[0], ret[1]);
  }
}

class MatchTeamInfo{
  /// 投籃數
  Fraction? shots;
  /// 三分球
  Fraction? triple;
  ///罰球
  Fraction? penalty;
// todo: Figma看不到下面還有什麼

  MatchTeamInfo({this.shots, this.triple, this.penalty}){
    assert(shots == null || (shots!.first >= 0 && shots!.second >= 0));
    assert(triple == null || (triple!.first >= 0 && triple!.second >= 0));
    assert(penalty == null || (penalty!.first >= 0 && penalty!.second >= 0));
  }
}

class PlayerInfo{
  final String name;
  /// 球衣號碼
  final int number;
  int fgma;
  final String team;
  int score;
  /// 抄截
  int steal;
  /// 籃板
  int rebound;
  /// 正式球員/板凳球員
  final bool isFormal;

  PlayerInfo({required this.name, required this.number, this.fgma = 0, required this.team, this.score = 0, this.steal = 0, this.rebound = 0, required this.isFormal}){
    assert(name.isNotEmpty);
    assert(number >= 0);
    assert(fgma >= 0);
    assert(team.isNotEmpty);
    assert(score >= 0);
    assert(steal >= 0);
    assert(rebound >= 0);
  }
}

class Fraction extends Pair<int, int>{
  const Fraction(int molecular, int denominator) : super(molecular, denominator);
}
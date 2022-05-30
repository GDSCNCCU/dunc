import 'lib_match_info.dart';

var exampleMatch = Match(
  team1: "法律",
  team2: '應數',
  team1NickName: "法",
  team2NickName: '數',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 3, 24),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: true
    )
  },
);


var exampleMatch2 = Match(
  team1: "資管",
  team2: '資科',
  team1NickName: "資",
  team2NickName: '科',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 3, 26),
  matchType: MatchType.playoffs,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch3 = Match(
  team1: "阿語",
  team2: '心理',
  team1NickName: "阿",
  team2NickName: '心',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 3, 27),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch4 = Match(
  team1: "金融",
  team2: '會計',
  team1NickName: "金",
  team2NickName: '會',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 4, 8),
  matchType: MatchType.playoffs,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch5 = Match(
  team1: "傳院",
  team2: '日文',
  team1NickName: "傳",
  team2NickName: '日',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 4, 9),
  matchType: MatchType.allStar,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch6 = Match(
  team1: "資科",
  team2: '日文',
  team1NickName: "資",
  team2NickName: '日',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 4, 15),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch7 = Match(
  team1: "中文",
  team2: '歐語',
  team1NickName: "中",
  team2NickName: '歐',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 4, 17),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch8 = Match(
  team1: "財政",
  team2: '經濟',
  team1NickName: "財",
  team2NickName: '經',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 1),
  matchType: MatchType.playoffs,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch9 = Match(
  team1: "財管",
  team2: '資管',
  team1NickName: "財",
  team2NickName: '資',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 2),
  matchType: MatchType.playoffs,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch10 = Match(
  team1: "應數",
  team2: '哲學',
  team1NickName: "數",
  team2NickName: '哲',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 3),
  matchType: MatchType.playoffs,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);


var exampleMatch11 = Match(
  team1: "國貿",
  team2: '教育',
  team1NickName: "貿",
  team2NickName: '教',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 5),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch12 = Match(
  team1: "韓文",
  team2: '政治',
  team1NickName: "韓",
  team2NickName: '政',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 5),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch13 = Match(
  team1: "公行",
  team2: '地政',
  team1NickName: "公",
  team2NickName: '地',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 6),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);

var exampleMatch14 = Match(
  team1: "風管",
  team2: '統計',
  team1NickName: "風",
  team2NickName: '統',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 7),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);



var exampleMatch15 = Match(
  team1: "英文",
  team2: '斯語',
  team1NickName: "英",
  team2NickName: '斯',
  score1: 51,
  score2: 47,
  date: DateTime(2022, 5, 8),
  matchType: MatchType.pointsMatch,
  place: '體育館',
  quarterScore1: [40, 60, 63, 50, 80, 79, 95],
  quarterScore2: [18, 29, 22, 18, 25, 25, 53],
  teamCmp1: MatchTeamInfo(
    shots: const Fraction(39, 80),
    triple: const Fraction(39, 80),
    penalty: const Fraction(39, 80)
  ),
  teamCmp2: MatchTeamInfo(
    shots: const Fraction(37, 81),
    triple: const Fraction(37, 81),
    penalty: const Fraction(37, 81)
  ),
  playerInfo1: {
    PlayerInfo(
      name: 'XXX',
      number: 8,
      team: '法律',
      score: 17,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 3,
      team: '風管',
      steal: 12,
      isFormal: true
    ),
    PlayerInfo(
      name: 'XXX',
      number: 9,
      team: '法文',
      rebound: 10,
      isFormal: false
    )
  },
  playerInfo2: {
    PlayerInfo(
      name: 'XXX',
      number: 55,
      team: '應數',
      score: 24,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 12,
      team: '阿語',
      steal: 11,
      isFormal: false
    ),
    PlayerInfo(
      name: 'XXX',
      number: 56,
      team: '政治',
      rebound: 7,
      isFormal: false
    )
  },
);
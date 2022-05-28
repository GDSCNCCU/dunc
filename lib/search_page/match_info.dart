import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';
import '../tools/pair.dart';
import 'lib_match_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'example_match.dart';
import 'dart:math';
import '../tools/grouped_text_radio_button.dart';

Set<String> _track = {};
Map<String, Match> matches = {'example': exampleMatch};

class MatchInfo extends StatefulWidget {
  const MatchInfo({Key? key}) : super(key: key);

  @override
  State<MatchInfo> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  // 這一頁有用到Navigator.pop以及page route

  int summaryOrBoxScoreIndex = 0;

  @override
  Widget build(BuildContext context) {
    // id toward one single match
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final match = matches[id]!;
    
    return Scaffold(
      backgroundColor: DuncColors.mainBackground,
      appBar: AppBar(
        leading: IconButton(
          color: const Color(0xff8a8989),
          icon: const Icon(
              Icons.arrow_back_ios
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        // 右上角追蹤與否
        actions: [RawMaterialButton(
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo]
            ).createShader(bounds),
            child: Icon(
              _track.contains(id)
                  ? Icons.subscriptions
                  : Icons.subscriptions_outlined,
              color: Colors.white,  // required for gradient
            ),
          ),
          onPressed: (){
            setState((){
              if(!_track.add(id)){
                _track.remove(id);
              }
            });
          },
        )],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 18, right: 18),
        children: [
          // toggle上方的所有物件
          Container(
            height: 151,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2,),
                // 隊伍及比數
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      match.team1,
                      style: const TextStyle(
                          color: DuncColors.indicatorImportant,
                          fontSize: 43,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 8,
                          fontFamily: 'Noto Sans TC'
                      ),
                    ),
                    Text(
                      ' ${match.score1} : ${match.score2} ',
                      style: const TextStyle(
                          color: DuncColors.matchInfo,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Lexend'
                      ),
                    ),
                    Text(
                      match.team2,
                      style: const TextStyle(
                          color: DuncColors.indicatorImportant,
                          fontSize: 43,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 8,
                          fontFamily: 'Noto Sans TC'
                      ),
                    )
                  ],
                ),
                const Spacer(),
                // 比賽類型
                Container(
                  width: 63,
                  height: 26,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4.5)),
                      color: match.matchType == MatchType.pointsMatch
                          ? DuncColors.pointsMatch
                          : (match.matchType == MatchType.allStar
                          ? DuncColors.allStar
                          : DuncColors.playoffs)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    match.matchType == MatchType.pointsMatch
                        ? '積分賽'
                        : (match.matchType == MatchType.allStar
                        ? '明星賽'
                        : '季後賽'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Noto Sans TC',
                        fontWeight: FontWeight.w400,
                        fontSize: 13
                    ),
                  ),
                ),
                const Spacer(flex: 2,),
                // 日期、地點
                Text(
                  '${match.date.month}/${match.date.day}‧${match.place}',
                  style: const TextStyle(
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: DuncColors.matchInfo
                  ),
                ),
                const Spacer(flex: 4,)
              ],
            ),
            // todo: temporary border
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
          ),
          // 中央toggle
          Neumorphic(
            margin: const EdgeInsets.only(top: 25, bottom: 16,),
            style: NeumorphicStyle(
              color: DuncColors.indicatorImportant,
              depth: -3,
              boxShape: NeumorphicBoxShape.roundRect(
                  const BorderRadius.all(Radius.circular(20))),
            ),
            child: NeumorphicToggle(
              height: 44,
              padding: const EdgeInsets.all(5),
              selectedIndex: summaryOrBoxScoreIndex,
              duration: const Duration(milliseconds: 500),
              movingCurve: Curves.easeInBack,
              // 已被選擇的項目的樣式
              thumb: Container(
                foregroundDecoration: const BoxDecoration(
                  color: DuncColors.secondaryCTAPurple,
                ),
              ),
              // 沒被選擇的項目的樣式
              style: const NeumorphicToggleStyle(
                backgroundColor: DuncColors.mainBackground,  // 整個toggle背景
                lightSource: LightSource(-0.6, -0.6),
                borderRadius: BorderRadius.all(Radius.circular(20)), // 選中項目
              ),
              children: [
                ToggleElement(
                    foreground: const Center(
                      child: Text(
                        'Summary',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    background: const Center(
                      child: Text(
                        'Summary',
                        style: TextStyle(
                            color: DuncColors.indicatorImportant,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    )
                ),
                ToggleElement(
                    foreground: const Center(
                      child: Text(
                        'Box Score',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    ),
                    background: const Center(
                      child: Text(
                        'Box Score',
                        style: TextStyle(
                            color: DuncColors.indicatorImportant,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                            fontSize: 15
                        ),
                      ),
                    )
                )
              ],
              onChanged: (int index){
                setState((){
                  summaryOrBoxScoreIndex = index;
                });
              },
            ),
          ),
          // toggle下方的所有物件
          Container(
            child: summaryOrBoxScoreIndex == 0 ? _Summary(match) : _BoxScore(match),
          ),
          const SizedBox(height: 200,),
        ],
      ),
    );
  }
}

class _Summary extends StatefulWidget {
  const _Summary(this.match, {Key? key}) : super(key: key);
  final Match match;

  @override
  State<_Summary> createState() => _SummaryState();
}

class _SummaryState extends State<_Summary> {
  late Pair<PlayerInfo?, PlayerInfo?> maxScorePlayers;
  late Pair<PlayerInfo?, PlayerInfo?> maxStealPlayers;
  late Pair<PlayerInfo?, PlayerInfo?> maxReboundPlayers;
  final summaryInfoCardStyle = NeumorphicStyle(
      color: DuncColors.mainBackground,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
      shadowLightColor: DuncColors.shadowLight,
      shadowDarkColor: DuncColors.shadowDark,
      depth: 4
  );
  static const TextStyle titleTextStyle = TextStyle(
      color: DuncColors.matchInfo,
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w600,
      fontSize: 15,
      letterSpacing: 1.5
  );

  @override
  void initState(){
    super.initState();
    maxScorePlayers = widget.match.maxScorePlayers;
    maxStealPlayers = widget.match.maxStealPlayers;
    maxReboundPlayers = widget.match.maxReboundPlayers;
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      // 各節比分
      Neumorphic(
        style: summaryInfoCardStyle,
        child: SizedBox(
          height: 229,
          child: Column(
            children: [
              // 圖表上方資訊
              SizedBox(
                height: 59,
                child: Row(
                  children: [
                    const SizedBox(width: 31,),
                    const Text(
                      '各節比分',
                      style: titleTextStyle,
                    ),
                    const Spacer(),
                    Text(
                      '${widget.match.score1} : ${widget.match.score2}',
                      style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: DuncColors.matchInfo
                      ),
                    ),
                    const Spacer(),
                    // 圖例
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                              (teamIndex){
                            if(teamIndex == 1){
                              return const SizedBox(height: 6,);
                            }
                            return Row(
                              children: [
                                Text(
                                  teamIndex == 0 ? widget.match.team1 : widget.match.team2,
                                  style: const TextStyle(
                                      fontFamily: 'Noto Sans TC',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: DuncColors.matchInfo
                                  ),
                                ),
                                const SizedBox(width: 11,),
                                Container(
                                  height: 1,
                                  width: 34,
                                  color: teamIndex == 0
                                      ? DuncColors.playoffs
                                      : DuncColors.pointsMatch,
                                )
                              ],
                            );
                          },
                          growable: false
                      ),
                    ),
                    const SizedBox(width: 31,)
                  ],
                ),
              ),
              // 圖表
              Flexible(
                child: LayoutBuilder(
                  builder: (context, boxConstrains){
                    return SizedBox(
                      width: boxConstrains.maxWidth - 96,
                      child: LineChart(
                          LineChartData(
                            // 資料點
                            lineBarsData: List.generate(
                                2,  // two teams
                                    (teamIndex) {
                                  return LineChartBarData(
                                    // xy值
                                    spots: List.generate(
                                        teamIndex == 0
                                            ? widget.match.quarterScore1?.length ?? 0  // return the value if it isn't null
                                            : widget.match.quarterScore2?.length ?? 0,
                                            (quarterIndex){
                                          return FlSpot(
                                              quarterIndex * 1.0,
                                              (teamIndex == 0
                                                  ? widget.match.quarterScore1![quarterIndex]
                                                  : widget.match.quarterScore2![quarterIndex]
                                              ) * 1.0
                                          );
                                        }
                                    ),
                                    color: teamIndex == 0
                                        ? DuncColors.playoffs
                                        : DuncColors.pointsMatch,
                                    barWidth: 1,
                                    shadow: Shadow(
                                        color: DuncColors.notSelectableText.withAlpha(41),
                                        offset: const Offset(0, 10)
                                    ),
                                    // 資料點樣式
                                    dotData: FlDotData(
                                      // 要不要顯示資料點
                                        checkToShowDot: (flSpot, _){
                                          return flSpot.x.toInt().isEven;
                                        },
                                        getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
                                            color: DuncColors.mainBackground,
                                            radius: 1.5,
                                            strokeColor: teamIndex == 0
                                                ? DuncColors.playoffs
                                                : DuncColors.pointsMatch,
                                            strokeWidth: 1.5
                                        )
                                    ),
                                  );
                                },
                                growable: false
                            ),
                            titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 21,
                                        interval: 20,
                                        getTitlesWidget: (value, meta) => Text(
                                          value.toInt().toString(),
                                          style: const TextStyle(
                                              color: DuncColors.notSelectableText,
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        )
                                    )
                                ),
                                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false,)),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 33,
                                        interval: 2,
                                        getTitlesWidget: (value, meta) => Flexible(
                                          child: Column(
                                            children: [
                                              const Spacer(),
                                              Text(
                                                'Q${value ~/ 2 + 1}',
                                                style: const TextStyle(
                                                    color: DuncColors.notSelectableText,
                                                    fontFamily: 'Lexend',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12
                                                ),
                                              ),
                                              const Spacer(flex: 2,)
                                            ],
                                          ),
                                        )
                                    )
                                ),
                                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
                            ),
                            borderData: FlBorderData(
                                show: true,
                                border: Border(
                                    bottom: BorderSide(
                                        color: DuncColors.notSelectableText.withAlpha(41),
                                        width: 1
                                    )
                                )
                            ),
                            // 點擊資料點後的樣式
                            lineTouchData: LineTouchData(
                              enabled: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.white,
                                tooltipPadding: const EdgeInsets.all(12),
                                tooltipRoundedRadius: 8,
                              ),
                            ),
                            minX: 0,
                            minY: 0,
                            // 資料點的對齊線
                            gridData: FlGridData(show: false),
                          )
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      const _SummaryTitle('兩隊比較', style: titleTextStyle,),
      Neumorphic(
        style: summaryInfoCardStyle,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // 背景兩個大字
            Row(
              children: List.generate(
                  3,
                      (index){
                    if(index == 1){
                      return const Spacer();
                    }
                    return ShaderMask(
                      shaderCallback: (rect) => LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            DuncColors.mainCTAFrom.withAlpha(94),
                            DuncColors.mainCTATo.withAlpha(120)
                          ]
                      ).createShader(rect),
                      child: Text(
                        index == 0 ? widget.match.team1NickName : widget.match.team2NickName,
                        style: const TextStyle(
                            fontFamily: 'Noto Sans TC',
                            fontWeight: FontWeight.w700,
                            fontSize: 105,
                            color: Colors.white // required for gradient applying
                        ),
                      ),
                    );
                  }
              ),
            ),
            // 隊伍的資訊
            LayoutBuilder(
              builder: (context, constraint) => SizedBox(
                width: constraint.maxWidth - 50,
                child: Column(
                  children: [
                    const SizedBox(height: 67.87,),
                    _SummarySingleTeamInfo(
                      title: '投籃數',
                      left: widget.match.teamCmp1?.shots ?? const Fraction(0, 0),
                      right: widget.match.teamCmp2?.shots ?? const Fraction(0, 0),
                    ),
                    _SummarySingleTeamInfo(
                      title: '三分球',
                      left: widget.match.teamCmp1?.triple ?? const Fraction(0, 0),
                      right: widget.match.teamCmp2?.triple ?? const Fraction(0, 0),
                    ),
                    _SummarySingleTeamInfo(
                      title: '罰球命中率',
                      left: widget.match.teamCmp1?.penalty ?? const Fraction(0, 0),
                      right: widget.match.teamCmp2?.penalty ?? const Fraction(0, 0),
                    ),
                    const SizedBox(height: 23,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // 最佳球員、查看全部文字
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _SummaryTitle('最佳球員', style: titleTextStyle,),
          const Spacer(),
          // 最佳球員右邊的查看全部
          Container(
            height: 81,
            padding: const EdgeInsets.only(right: 19),
            child: Column(
              children: [
                const Spacer(flex: 40,),
                LayoutBuilder(
                  builder: (context, rect) => RawMaterialButton(
                    constraints: const BoxConstraints(
                        minHeight: 15
                    ),
                    child: const Text(
                      '查看全部',
                      style: TextStyle(
                          color: DuncColors.secondaryCTAPurple,
                          fontFamily: 'Lexend',
                          fontSize: 12,
                          letterSpacing: 1.5
                      ),
                    ),
                    onPressed: (){
                      // todo: Figma上沒有相應的內容
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("敬請期待"),
                            duration: Duration(milliseconds: 1500),
                          )
                      );
                    },
                  ),
                ),
                const Spacer(flex: 19,)
              ],
            ),
          )
        ],
      ),
      // 最佳球員
      Column(
        children: [
          _SummaryBestPlayerCard(
            players: maxScorePlayers,
            leftNum: maxScorePlayers.first?.score ?? 0,
            title: '得分',
            rightNum: maxScorePlayers.second?.score ?? 0,
            cardStyle: summaryInfoCardStyle,
          ),
          _SummaryBestPlayerCard(
            players: maxStealPlayers,
            leftNum: maxStealPlayers.first?.steal ?? 0,
            title: '抄截',
            rightNum: maxStealPlayers.second?.steal ?? 0,
            cardStyle: summaryInfoCardStyle,
          ),
          _SummaryBestPlayerCard(
            players: maxReboundPlayers,
            leftNum: maxReboundPlayers.first?.rebound ?? 0,
            title: '籃板',
            rightNum: maxReboundPlayers.second?.rebound ?? 0,
            cardStyle: summaryInfoCardStyle,
          ),
        ],
      ),
      const SizedBox(height: 40,),
    ],
  );
}

class _SummaryTitle extends StatelessWidget {
  const _SummaryTitle(this.title, {Key? key, required this.style}) : super(key: key);
  final TextStyle style;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 17),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Text(
            title,
            style: style,
          ),
          const SizedBox(height: 19,)
        ],
      ),
    );
  }
}

class _SummarySingleTeamInfo extends StatelessWidget {
  const _SummarySingleTeamInfo({Key? key, required this.title, required this.left, required this.right}) : super(key: key);
  final String title;
  final Fraction left;
  final Fraction right;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      // 文字
      SizedBox(
        height: 23.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${left.first}/${left.second}(${(left.first / left.second * 100).toStringAsFixed(1)}%)',
              style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: DuncColors.matchInfo
              ),
            ),
            const Spacer(),
            LayoutBuilder(
              builder: (context, constraint) =>
                  SizedBox(
                    height: constraint.maxHeight,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: DuncColors.matchInfo
                      ),
                    ),
                  ),
            ),
            const Spacer(),
            Text(
              '${right.first}/${right.second}(${(right.first / right.second * 100).toStringAsFixed(1)}%)',
              style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: DuncColors.matchInfo
              ),
            )
          ],
        ),
      ),
      // 顏色條
      LayoutBuilder(
        builder: (context, rect) => SizedBox(
          // width: rect.maxWidth,
          child: Row(
            children: [
              // 左邊的條
              Container(
                width: rect.maxWidth / 2 - 9,
                height: 16,
                alignment: Alignment.bottomCenter,
                child: NeumorphicProgress(
                  percent: left.first / left.second,
                  style: const ProgressStyle(
                    depth: 4,
                    accent: DuncColors.playoffs,
                    variant: DuncColors.playoffs,
                    border: NeumorphicBorder(
                        color: Colors.white,
                        width: 3
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18,),
              // 右邊的條
              Container(
                width: rect.maxWidth / 2 - 9,
                height: 16,
                alignment: Alignment.bottomCenter,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: NeumorphicProgress(
                    percent: right.first / right.second,
                    style: const ProgressStyle(
                      depth: 4,
                      accent: DuncColors.pointsMatch,
                      variant: DuncColors.pointsMatch,
                      border: NeumorphicBorder(
                          color: Colors.white,
                          width: 3
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 23,)
    ],
  );
}

class _SummaryBestPlayerCard extends StatelessWidget {
  const _SummaryBestPlayerCard({Key? key, required this.players, required this.leftNum, required this.title, required this.rightNum, required this.cardStyle}) : super(key: key);
  final Pair<PlayerInfo?, PlayerInfo?> players;
  final int leftNum;
  final String title;
  final int rightNum;
  final NeumorphicStyle cardStyle;

  static const TextStyle grayTxtStyle = TextStyle(
      color: DuncColors.matchInfo,
      fontFamily: 'Lexend',
      fontSize: 12,
      letterSpacing: 1.3
  );

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top: 7, bottom: 7),
    alignment: Alignment.center,
    child: Neumorphic(
      style: cardStyle,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SummaryBottomCloth(players.first?.number ?? 0),
            const SizedBox(width: 5,),
            // 左側名字與科系
            Column(
              children: [
                Text(
                  players.first?.name ?? '未知',
                  style: grayTxtStyle,
                ),
                Container(
                  height: 1,
                  width: 28.5,
                  color: DuncColors.matchInfo,
                ),
                Text(
                  players.first?.team ?? '未知',
                  style: grayTxtStyle,
                )
              ],
            ),
            const Spacer(),
            // 左側數字
            Text(
              leftNum.toString(),
              style: const TextStyle(
                  color: DuncColors.secondaryCTAPurple,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  fontSize: 30
              ),
            ),
            const SizedBox(width: 7,),
            // 中央文字
            Text(
              title,
              style: grayTxtStyle,
            ),
            const SizedBox(width: 7,),
            // 右側數字
            Text(
              rightNum.toString(),
              style: const TextStyle(
                  color: DuncColors.secondaryCTAPurple,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w700,
                  fontSize: 30
              ),
            ),
            const Spacer(),
            // 右側名字與科系
            Column(
              children: [
                Text(
                  players.second?.name ?? '未知',
                  style: grayTxtStyle,
                ),
                Container(
                  height: 1,
                  width: 28.5,
                  color: DuncColors.matchInfo,
                ),
                Text(
                  players.second?.team ?? '未知',
                  style: grayTxtStyle,
                )
              ],
            ),
            const SizedBox(width: 5,),
            _SummaryBottomCloth(players.second?.number ?? 0),
          ],
        ),
      ),
    ),
  );
}

class _SummaryBottomCloth extends StatelessWidget {
  const _SummaryBottomCloth(this.num, {Key? key}) : super(key: key);
  final int num;

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.center,
    children: [
      // todo: 不曉得愷祐什麼時候會給我圖
      const Icon(
        Icons.accessibility_new_outlined,
        color: DuncColors.secondaryCTAPurple,
        size: 60,
      ),
      Text(
        '#$num',
        style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Lexend',
            fontSize: 11
        ),
      )
    ],
  );
}

class _BoxScore extends StatefulWidget {
  const _BoxScore(this.match, {Key? key}) : super(key: key);

  final Match match;

  @override
  State<_BoxScore> createState() => _BoxScoreState();
}

class _BoxScoreState extends State<_BoxScore> {
  int selectedTeamIndex = 0;
  static const selectedTextStyle = TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: DuncColors.secondaryCTAPurple
  );
  var unSelectedTextStyle = TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: DuncColors.matchInfo.withAlpha(122)
  );
  late final Pair<List<PlayerInfo>, List<PlayerInfo>> formalPlayers;
  late final Pair<List<List<dynamic>>, List<List<dynamic>>> _formalPlayersFields;
  late final Pair<List<PlayerInfo>, List<PlayerInfo>> benchPlayers;
  late final Pair<List<List<dynamic>>, List<List<dynamic>>> _benchPlayersFields;
  
  @override
  void initState(){
    super.initState();
    formalPlayers = Pair(
        widget.match.playerInfo1?.where(
            (element) => element.isFormal
        ).toList(growable: false) ?? [],
        widget.match.playerInfo2?.where(
            (element) => element.isFormal
        ).toList(growable: false) ?? []
    );

    _formalPlayersFields = Pair(
        List.generate(
            formalPlayers.first.length,
                (index) => formalPlayers.first[index].fields,
            growable: false
        ),
        List.generate(
            formalPlayers.second.length,
                (index) => formalPlayers.second[index].fields,
            growable: false
        )
    );

    benchPlayers = Pair(
        widget.match.playerInfo1?.where(
                (element) => !element.isFormal
        ).toList(growable: false) ?? [],
        widget.match.playerInfo2?.where(
                (element) => !element.isFormal
        ).toList(growable: false) ?? []
    );

    _benchPlayersFields = Pair(
        List.generate(
            benchPlayers.first.length,
                (index) => benchPlayers.first[index].fields,
            growable: false
        ),
        List.generate(
            benchPlayers.second.length,
                (index) => benchPlayers.second[index].fields,
            growable: false
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 兩隊選擇
        GroupedTextRadioButton(
          radioStyle: NeumorphicRadioStyle(
              selectedDepth: -3,
              unselectedDepth: 3,
              selectedColor: DuncColors.mainBackground,
              unselectedColor: DuncColors.mainBackground,
              lightSource: LightSource.topLeft,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
              shape: NeumorphicShape.flat
          ),
          padding: const EdgeInsets.only(
              left: 12, right: 12, top: 8, bottom: 8),
          onChanged: (index) {
            setState(() {
              if(index != null){
                selectedTeamIndex = index;
              }
            });
          },
          selections: [widget.match.team1NickName, widget.match.team2NickName],
          selectedTextStyle: selectedTextStyle,
          unSelectedTextStyle: unSelectedTextStyle,
          selectedIndex: selectedTeamIndex,
        ),
        const SizedBox(height: 28.75,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              // 正式球員標題列
              _BoxScoreHorizontalData<String>(
                heightOfTitleBg: 35,
                title: '正式球員',
                data: List.generate(
                    PlayerInfoFields.values.length - 2,  // 去除姓名、正式/板凳
                        (index) => playerInfoFieldToString(PlayerInfoFields.values[index + 1])  // 去除姓名
                ),
                bgColor: DuncColors.secondaryCTAPurple,
                txtColor: Colors.white,
              )
            ] // 正式球員們
                + List.generate(
                    selectedTeamIndex == 0 ? formalPlayers.first.length : formalPlayers.second.length,
                    (playerIndex) => _BoxScoreHorizontalData(
                      heightOfTitleBg: 32.43,
                      title: selectedTeamIndex == 0 ? formalPlayers.first[playerIndex].name : formalPlayers.second[playerIndex].name,
                      data: List.generate(
                          PlayerInfoFields.values.length - 2,  // 去除姓名、正式/板凳
                              (fieldIndex) => selectedTeamIndex == 0 ? _formalPlayersFields.first[playerIndex][fieldIndex + 1] : _formalPlayersFields.second[playerIndex][fieldIndex + 1],  // 去除姓名
                          growable: false
                      ),
                      bgColor: playerIndex.isEven ? Colors.white : DuncColors.notSelectableText.withAlpha(30),
                      txtColor: Colors.black,
                    ),
                    growable: false
                )
                + [  // 板凳球員標題列
                  _BoxScoreHorizontalData<String>(
                    heightOfTitleBg: 35,
                    title: '板凳球員',
                    data: List.generate(
                        PlayerInfoFields.values.length - 2,  // 去除姓名、正式/板凳
                            (index) => playerInfoFieldToString(PlayerInfoFields.values[index + 1])  // 去除姓名
                    ),
                    bgColor: DuncColors.secondaryCTAPurple,
                    txtColor: Colors.white,
                  )
                ]  //板凳球員們
                + List.generate(
                    selectedTeamIndex == 0 ? benchPlayers.first.length : benchPlayers.second.length,
                    (playerIndex) => _BoxScoreHorizontalData(
                      heightOfTitleBg: 32.43,
                      title: selectedTeamIndex == 0 ? benchPlayers.first[playerIndex].name : benchPlayers.second[playerIndex].name,
                      data: List.generate(
                          PlayerInfoFields.values.length - 2,  // 去除姓名、正式/板凳
                              (fieldIndex) => selectedTeamIndex == 0 ? _benchPlayersFields.first[playerIndex][fieldIndex + 1] : _benchPlayersFields.second[playerIndex][fieldIndex + 1],  // 去除姓名
                          growable: false
                      ),
                      bgColor: playerIndex.isEven ? Colors.white : DuncColors.notSelectableText.withAlpha(30),
                      txtColor: Colors.black,
                    ),
                    growable: false
                ),
          ),
        ),
      ],
    );
  }
}

/// 用來建立選擇隊伍的[GroupedTextRadioButton]下方的一條資訊
///
/// 可指定除了最左側格子右邊資訊的型態
class _BoxScoreHorizontalData<T> extends StatelessWidget {
  const _BoxScoreHorizontalData({Key? key, required this.heightOfTitleBg, required this.title, required this.data, required this.bgColor, required this.txtColor}) : super(key: key);
  final double heightOfTitleBg;
  final String title;
  final List<T> data;
  final Color bgColor;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    final txtStyle = TextStyle(
      color: txtColor,
      fontFamily: 'Noto Sans TC',
      fontWeight: FontWeight.w400,
      fontSize: 12
    );
    final borderRadius = BorderRadius.circular(8);

    return SizedBox(
      height: 48,
      child: Row(
        children: [
          // 左側標題、人名
          Container(
            height: heightOfTitleBg,
            width: 129,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: bgColor
            ),
            child: Text(
              title,
              style: txtStyle,
            ),
          ),
          const SizedBox(width: 12.17,),
          // 右側表格內容
          Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: borderRadius
            ),
            child: Row(
              children: List.generate(  // 右側表格內容
                  data.length,
                  (index) => Container(
                    height: 35,
                    width: 79,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: borderRadius
                    ),
                    child: Text(
                      '${data[index]}',
                      style: txtStyle,
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

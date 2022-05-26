import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';
import 'lib_match_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'example_match.dart';

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
      body: Column(
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
            margin: const EdgeInsets.only(top: 25, bottom: 16, left: 13, right: 13),
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
          Flexible(
            child: ListView(
              padding: const EdgeInsets.only(left: 7, right: 7),
              children: summaryOrBoxScoreIndex == 0 ? _summary(match) : _boxScore(match),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _summary(final Match match){
  const TextStyle titleTextStyle = TextStyle(
    color: DuncColors.matchInfo,
    fontFamily: 'Lexend',
    fontWeight: FontWeight.w600,
    fontSize: 15
  );

  Container summaryTitle(final String title){
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 17),
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Text(
            title,
            style: titleTextStyle,
          ),
          const SizedBox(height: 19,)
        ],
      ),
    );
  }

  return [
    // 各節比分
    Neumorphic(
      style: _summaryInfoCardStyle,
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
                    '${match.score1}：${match.score2}',
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
                              teamIndex == 0 ? match.team1 : match.team2,
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
                                        ? match.quarterScore1?.length ?? 0  // return the value if it isn't null
                                        : match.quarterScore2?.length ?? 0,
                                      (quarterIndex){
                                        return FlSpot(
                                            quarterIndex * 1.0,
                                            (teamIndex == 0
                                                ? match.quarterScore1![quarterIndex]
                                                : match.quarterScore2![quarterIndex]
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
    summaryTitle('兩隊比較')
  ];
}

List<Widget> _boxScore(final Match match){
  return [];
}

final _summaryInfoCardStyle = NeumorphicStyle(
    color: DuncColors.mainBackground,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
    shadowLightColor: DuncColors.shadowLight,
    shadowDarkColor: DuncColors.shadowDark,
    depth: 4
);
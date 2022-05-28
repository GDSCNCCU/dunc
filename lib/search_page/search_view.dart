import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';
import './team.dart';
import './match.dart';

int _searchTeamOrMatchToggleIndex = 0;

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final NeumorphicTextStyle toggleTextStyle = NeumorphicTextStyle(
      fontFamily: "Lexend",
      fontSize: 16,
      fontWeight: FontWeight.w700
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DuncColors.mainBackground,
      body: Column(
        children: <Widget>[
          // 「找球隊/球員、找比賽」
          Neumorphic(
              margin: const EdgeInsets.only(
                  left: 60, top: 50, right: 60, bottom: 12),
              style: NeumorphicStyle(
                color: Colors.white,
                depth: -3,
                intensity: 1,
                surfaceIntensity: 0,
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(20))),
              ),
              child: NeumorphicToggle(
                height: 45,
                padding: const EdgeInsets.only(left: 7, top: 6, right: 7, bottom: 6),
                movingCurve: Curves.easeInBack,
                duration: const Duration(milliseconds: 500),
                selectedIndex: _searchTeamOrMatchToggleIndex,
                onChanged: (int index) {
                  setState(() {
                    _searchTeamOrMatchToggleIndex = index;
                  });
                },
                children: [
                  ToggleElement(
                    foreground: Center(
                        child: NeumorphicText('找球隊/球員',
                            style: const NeumorphicStyle(
                                color: Colors.white, depth: 0),
                            textStyle: toggleTextStyle)),
                    background: Center(
                      child: NeumorphicText('找球隊/球員',
                          style: const NeumorphicStyle(
                              color: DuncColors.indicatorImportant, depth: 0),
                          textStyle: toggleTextStyle),
                    ),
                  ),
                  ToggleElement(
                      foreground: Center(
                        child: NeumorphicText('找比賽',
                            style: const NeumorphicStyle(
                                color: Colors.white, depth: 0),
                            textStyle: toggleTextStyle),
                      ),
                      background: Center(
                        child: NeumorphicText('找比賽',
                            style: const NeumorphicStyle(
                                color: DuncColors.indicatorImportant, depth: 0),
                            textStyle: toggleTextStyle),
                      ))
                ],
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
              )),
          _searchTeamOrMatchToggleIndex == 0 ? const TeamWidgets() : const MatchWidgets()
        ]
      ),
    );
  }
}
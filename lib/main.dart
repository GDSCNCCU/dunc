import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './profile/profileview.dart';
import './tools/colors.dart';
import 'search/team.dart';
import 'search/match.dart';

void main() {
  runApp(const MyApp());
}

double? screenWidth; // set in build of _SearchViewState
int searchTeamOrMatchToggleIndex = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'dUNC',
      home: ProfileView(),
    );

    // 測試ProfileView
    // 非正式
    // return const MaterialApp(
    //   home: ProfileView(),
    // );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  NeumorphicTextStyle toggleTextStyle = NeumorphicTextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "GenSenRounded JP",
      fontSize: 16);

  String searchTeamText = "";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          Neumorphic(
              // 「找球隊/球員、找比賽」
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
                selectedIndex: searchTeamOrMatchToggleIndex,
                onChanged: (int index) {
                  setState(() {
                    searchTeamOrMatchToggleIndex = index;
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
                              color: Colors.grey, depth: 0),
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
                                color: Colors.grey, depth: 0),
                            textStyle: toggleTextStyle),
                      ))
                ],
                thumb: Container(
                  // 已被選擇的項目的樣式
                  foregroundDecoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [blue, purple]),
                  ),
                ),
                style: const NeumorphicToggleStyle(
                  // 沒被選擇的項目的樣式
                  backgroundColor: backgroundColor,
                  lightSource: LightSource(-0.6, -0.6),
                  borderRadius: BorderRadius.all(Radius.circular(20)), // 選中項目
                ),
              )),
        ] +
            (searchTeamOrMatchToggleIndex == 0
                ? teamWidgets(searchTeamText, searchTextUpdater, screenWidth!)
                : matchWidgets(screenWidth!)),
      ),
    );
  }

  void searchTextUpdater(String text){
    searchTeamText = text;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './profile/profileview.dart';
import './tools/colors.dart';

void main() {
  runApp(const MyApp());
}

double? screenWidth; // set in build of _SearchViewState

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'dUNC',
      home: SearchView(),
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

int selectedIndex = 0;

class _SearchViewState extends State<SearchView> {
  NeumorphicTextStyle toggleTextStyle = NeumorphicTextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "GenSenRounded JP",
      fontSize: 16);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
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
                movingCurve: Curves.easeInBack,
                duration: const Duration(milliseconds: 500),
                selectedIndex: selectedIndex,
                onChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
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
          Neumorphic(
              // 搜尋
              margin: const EdgeInsets.only(
                  left: 50, top: 12, right: 50, bottom: 12),
              style: NeumorphicStyle(
                color: backgroundColor,
                depth: -3,
                intensity: 1,
                surfaceIntensity: 0,
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(40))),
              ),
              child: SizedBox(
                width: screenWidth! - 100, // 扣掉margin、搜尋icon
                height: 46,
                child: TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "輸入球隊/員",  //todo: 換成找比賽時要換
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.only(top: 13)
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  cursorColor: blue,
                  style: const TextStyle(
                      fontFamily: "GenSenRounded JP", fontSize: 16),
                  onChanged: (str) {}, //todo
                ),
              )),
          Row(
            // 搜尋過、已加入我的最愛
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              NeumorphicButton(
                // 搜尋過
                margin: const EdgeInsets.only(
                    left: 0, top: 15, right: 0, bottom: 12),
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 20, right: 20),
                style: NeumorphicStyle(
                    depth: 0,
                    color: const Color(0xffbb9bcc),
                    disableDepth: true,
                    boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(16)))),
                child: NeumorphicText("搜尋過",
                    style: const NeumorphicStyle(color: Colors.white),
                    textStyle: NeumorphicTextStyle(
                        fontFamily: "GenSenRounded JP", fontSize: 12)),
              ),
              const Spacer(),
              NeumorphicButton(
                margin: const EdgeInsets.only(
                    left: 0, top: 15, right: 0, bottom: 12),
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 11, right: 11),
                style: NeumorphicStyle(
                    depth: 0,
                    color: const Color(0xffbb9bcc),
                    disableDepth: true,
                    boxShape: NeumorphicBoxShape.roundRect(
                        const BorderRadius.all(Radius.circular(16)))),
                child: NeumorphicText("已加入我的最愛",
                    style: const NeumorphicStyle(color: Colors.white),
                    textStyle: NeumorphicTextStyle(
                        fontFamily: "GenSenRounded JP", fontSize: 12)),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}

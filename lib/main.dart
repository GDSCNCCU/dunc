import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

const purple = Color(0xffaf57dc);
const blue = Color(0xff7b78e2);
const backgroundColor = Color(0xffe5e5e5);
double? screenWidth;  // set in build of _MyHomePageState

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'dUNC',
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Neumorphic(  // 「找球隊/球員、找比賽」
            margin: const EdgeInsets.only(
                left: 50,
                top: 50,
                right: 50,
                bottom: 12
            ),
            style: NeumorphicStyle(
              color: Colors.white,
              shape: NeumorphicShape.flat,
              depth: -3,
              intensity: 1,
              surfaceIntensity: 0,
              boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(20))),
            ),
            child: NeumorphicToggle(
              children: [
                ToggleElement(
                  foreground: Center(child: NeumorphicText(
                    '找球隊/球員',
                    style: const NeumorphicStyle(color: Colors.white),
                    textStyle: NeumorphicTextStyle(
                      fontFamily: "GenSenRounded JP",
                      fontSize: 16
                    ),
                  ),),
                  background: Center(child: NeumorphicText(
                    '找球隊/球員',
                    style: const NeumorphicStyle(color: Colors.black),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: "GenSenRounded JP",
                        fontSize: 16
                      )
                  ),),
                ),
                ToggleElement(
                  foreground: Center(child: NeumorphicText(
                    '找比賽',
                    style: const NeumorphicStyle(color: Colors.white),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: "GenSenRounded JP",
                        fontSize: 16
                      )
                  ),),
                  background: Center(child: NeumorphicText(
                    '找比賽',
                    style: const NeumorphicStyle(color: Colors.black),
                      textStyle: NeumorphicTextStyle(
                        fontFamily: "GenSenRounded JP",
                        fontSize: 16
                      )
                  ),)
                )
              ],

              thumb: Container(  // 已被選擇的項目的樣式
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [blue, purple]
                  ),
                ),
              ),

              style: const NeumorphicToggleStyle(  // 沒被選擇的項目的樣式
                backgroundColor: backgroundColor,
                lightSource: LightSource(-0.6, -0.6),
                borderRadius: BorderRadius.all(Radius.circular(20)),  // 選中項目
              ),
            )
          ),
          Neumorphic(  // 搜尋
            margin: const EdgeInsets.only(
              left: 50,
              top: 12,
              right: 50,
              bottom: 12
            ),
            style: NeumorphicStyle(
              color: backgroundColor,
              shape: NeumorphicShape.flat,
              depth: -3,
              intensity: 1,
              surfaceIntensity: 0,
              boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(20))),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 35,
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth! - 155,  // 扣掉margin、搜尋icon
                    child: TextField(
                      decoration: null,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      autofocus: true,
                      cursorColor: blue,
                      style: const TextStyle(
                        fontFamily: "GenSenRounded JP",
                        fontSize: 14
                      ),
                      onChanged: (str) {}, //todo
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(  // 搜尋過、已加入我的最愛
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2,),
              NeumorphicButton(  // 搜尋過
                margin: const EdgeInsets.only(
                  left: 0,
                  top: 15,
                  right: 0,
                  bottom: 12
                ),
                padding: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                  left: 20,
                  right: 20
                ),
                style: NeumorphicStyle(
                  depth: 0,
                  color: const Color(0xffbb9bcc),
                  disableDepth: true,
                  boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(16)))
                ),
                child: NeumorphicText(
                  "搜尋過",
                  style: const NeumorphicStyle(
                    color: Colors.white
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontFamily: "GenSenRounded JP",
                    fontSize: 12
                  )
                ),
              ),
              const Spacer(),
              NeumorphicButton(
                margin: const EdgeInsets.only(
                    left: 0,
                    top: 15,
                    right: 0,
                    bottom: 12
                ),
                padding: const EdgeInsets.only(
                top: 3,
                bottom: 3,
                left: 11,
                right: 11
                ),
                style: NeumorphicStyle(
                    depth: 0,
                    color: const Color(0xffbb9bcc),
                    disableDepth: true,
                    boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(16)))
                ),
                child: NeumorphicText(
                  "已加入我的最愛",
                  style: const NeumorphicStyle(
                      color: Colors.white
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontFamily: "GenSenRounded JP",
                    fontSize: 12
                  )
                ),
              ),
              const Spacer(flex: 2,)
            ],
          )
        ],
      ),
    );
  }
}

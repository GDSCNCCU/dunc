import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './home_page/home_view.dart';
import './search_page/search_view.dart';
import './profile_page/profile_view.dart';
import '../tools/colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;

  List pages = [const SearchView(), const HomePage(), const ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: pages[_selectedIndex],
          ),
          Align(
            alignment: Alignment(0, 0.72),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: DuncColors.mainBackground,
                boxShadow: [
                  BoxShadow(
                    color: DuncColors.mainBackground,
                    spreadRadius: 50,
                    blurRadius: 30,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.72),
            child: Container(
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    DuncColors.mainCTAFrom,
                    DuncColors.mainCTATo,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        width: 62,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 146, 185, 143),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                        ),
                        child: Text(
                          '積分賽',
                          style: TextStyle(
                            color: DuncColors.mainBackground,
                            fontSize: 14,
                            fontFamily: 'Noto Sans TC',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '地政 VS 心理',
                        style: TextStyle(
                          color: DuncColors.mainBackground,
                          fontSize: 16,
                          fontFamily: 'Noto Sans TC',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '比賽中',
                            style: TextStyle(
                              color: DuncColors.mainBackground,
                              fontSize: 14,
                              fontFamily: 'Noto Sans TC',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 13.5,
                      ),
                      Container(
                        width: 82,
                        height: 2,
                        color: DuncColors.mainBackground,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 82,
                        height: 2,
                        color: DuncColors.mainBackground,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 82,
                        height: 2,
                        color: DuncColors.mainBackground,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 82,
                        height: 2,
                        color: DuncColors.mainBackground,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 85,
              color: DuncColors.mainBackground,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Neumorphic(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: -3,
                intensity: 1,
                surfaceIntensity: 0,
                boxShape: NeumorphicBoxShape.stadium(),
              ),
              child: NeumorphicToggle(
                duration: Duration(milliseconds: 350),
                selectedIndex: _selectedIndex,
                padding: const EdgeInsets.only(
                    top: 9, bottom: 9, left: 11, right: 11),
                onChanged: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                height: 73,
                children: [
                  ToggleElement(
                    foreground: Center(
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight,
                            colors: [
                              DuncColors.mainCTATo,
                              DuncColors.mainCTAFrom
                            ]).createShader(bounds),
                        child: const Icon(
                          Icons.search,
                          size: 45,
                        ),
                      ),
                    ),
                    background: const Center(
                      child: Icon(
                        Icons.search,
                        size: 45,
                        color: Color.fromARGB(255, 201, 200, 191),
                      ),
                    ),
                  ),
                  ToggleElement(
                    foreground: Center(
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight,
                            colors: [
                              DuncColors.mainCTATo,
                              DuncColors.mainCTAFrom
                            ]).createShader(bounds),
                        child: const Icon(
                          Icons.home_filled,
                          size: 42,
                        ),
                      ),
                    ),
                    background: const Center(
                      child: Icon(
                        Icons.home_filled,
                        size: 42,
                        color: Color.fromARGB(255, 201, 200, 191),
                      ),
                    ),
                  ),
                  ToggleElement(
                    foreground: Center(
                      child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.topRight,
                            colors: [
                              DuncColors.mainCTATo,
                              DuncColors.mainCTAFrom
                            ]).createShader(bounds),
                        child: const Icon(
                          Icons.subscriptions,
                          size: 42,
                        ),
                      ),
                    ),
                    background: const Center(
                      child: Icon(
                        Icons.subscriptions,
                        size: 42,
                        color: Color.fromARGB(255, 201, 200, 191),
                      ),
                    ),
                  ),
                ],
                thumb: Container(
                  color: DuncColors.mainBackground,
                ),
                style: const NeumorphicToggleStyle(
                  backgroundColor: DuncColors.mainBackground,
                  depth: 10,
                  lightSource: LightSource(-0.2, -0.2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

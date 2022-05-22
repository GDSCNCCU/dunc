import 'package:flutter_application_1/home_page/home_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_application_1/search_page/search_view.dart';
import 'package:flutter_application_1/profile_page/profile_view.dart';
import '../tools/colors.dart';

const purple = Color.fromARGB(255, 254, 114, 254);
const blue = Color.fromARGB(255, 140, 107, 248);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  List pages = [
    const SearchView(),
    const HomePage(),
    const ProfileView()
  ];
/*
  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: pages[_selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 85,
                decoration: const BoxDecoration(
                  color: DuncColors.mainBackground,
                )),
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
                  selectedIndex: _selectedIndex,
                  padding:
                      const EdgeInsets.only(top: 9, bottom: 9, left: 11, right: 11),
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
                              colors: [blue, purple]).createShader(bounds),
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
                              colors: [blue, purple]).createShader(bounds),
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
                                colors: [blue, purple]).createShader(bounds),
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
                        ))
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
                )),
          )
        ],
      ),
    );
  }
}

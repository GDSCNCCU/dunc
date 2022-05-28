import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '/tools/colors.dart';

// ignore: camel_case_types
class gameCard extends StatelessWidget {
  final String gameTime;
  final String gameType;
  final String gameColor;
  final String guestTeam;
  final String homeTeam;

  // ignore: use_key_in_widget_constructors
  const gameCard(
      {required this.gameTime,
      required this.gameType,
      required this.guestTeam,
      required this.homeTeam,
      required this.gameColor});

  Widget gametype(String s) {
    if (s == "季後賽") {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), color: DuncColors.playoffs,),
        width: 60,
        child: NeumorphicText(
          gameType,
          style: const NeumorphicStyle(
            depth: 4, //customize depth here
            color: Color.fromARGB(255, 59, 58, 59), //customize color here
          ),
          textStyle:
              NeumorphicTextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      );
    } else if (s == "積分賽") {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), color: DuncColors.pointsMatch,),
        width: 60,
        child: NeumorphicText(
          gameType,
          style: const NeumorphicStyle(
            depth: 4, //customize depth here
            color: Color.fromARGB(255, 59, 58, 59), //customize color here
          ),
          textStyle:
              NeumorphicTextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), color: DuncColors.allStar,),
        width: 60,
        child: NeumorphicText(
          gameType,
          style: const NeumorphicStyle(
            depth: 4, //customize depth here
            color: Color.fromARGB(255, 59, 58, 59), //customize color here
          ),
          textStyle:
              NeumorphicTextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      );
    }
    //return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: NeumorphicText(
              gameTime,
              style: const NeumorphicStyle(
                depth: 4, //customize depth here
                color: Color.fromARGB(255, 59, 58, 59), //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                  fontSize: 15, fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: 
                NeumorphicButton(
              //margin: const EdgeInsets.only(top: 6, left: 19, right: 19),
              //padding: const EdgeInsets.only(left: 21, right: 21),
              style: const NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  lightSource: LightSource.topLeft,
                  color: DuncColors.mainBackground,
                  shadowDarkColor: DuncColors.shadowDark,
                  shadowLightColor: DuncColors.shadowLight,
                  depth: 12
              ),
                child: Container(
                  height: 30,
                  width: 300,
                  child: Center(
                      child: Row(
                    children: <Widget>[
                      gametype(gameType),
                      const SizedBox(
                        width: 30,
                      ),
                      NeumorphicText(
                        "$guestTeam VS $homeTeam",
                        style: const NeumorphicStyle(
                          depth: 4, //customize depth here
                          color: Color.fromARGB(
                              255, 59, 58, 59), //customize color here
                        ),
                        textStyle: NeumorphicTextStyle(
                            fontSize: 17, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      NeumorphicText(
                        "比賽中",
                        style: const NeumorphicStyle(
                            depth: 4, //customize depth here
                            color: Colors.purple //customize color here
                            ),
                        textStyle: NeumorphicTextStyle(
                            fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                    ],
                  )),
                ),
                onPressed: (){

                },
                )
                ,
          ),
        ]);
  }
}

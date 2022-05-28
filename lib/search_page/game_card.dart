import 'package:dunc/search_page/lib_match_info.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '/tools/colors.dart';
import 'match_info.dart';

bool pressed = true;
// ignore: camel_case_types

class GameCard2 extends StatefulWidget {
  final gameDate;
  final gameType;
  final String gameColor;
  final String guestTeam;
  final String homeTeam;

  // ignore: use_key_in_widget_constructors
  const GameCard2(
      {required this.gameDate,
      required this.gameType,
      required this.guestTeam,
      required this.homeTeam,
      required this.gameColor,
  });
  @override
  State<GameCard2> createState() => _GameCard2State();

  Widget gametype(s) {
    if (s == MatchType.playoffs) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), color: DuncColors.playoffs,),
        //padding: const EdgeInsets.only(left: 20),
        width: 60,
        //color: Colors.orange,
        child: NeumorphicText(
          "季後賽",
          style: const NeumorphicStyle(
            depth: 4, //customize depth here
            color: Color.fromARGB(255, 59, 58, 59), //customize color here
          ),
          textStyle:
              NeumorphicTextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      );
    } else if (s == MatchType.pointsMatch) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.5), color: DuncColors.pointsMatch,),
        //padding: const EdgeInsets.only(left: 20),
        width: 60,
        child: NeumorphicText(
          "積分賽",
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
        //padding: const EdgeInsets.only(left: 20),
        width: 60,  
        child: NeumorphicText(
          "明星賽",
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
}
class _GameCard2State extends State<GameCard2>{
    
    @override
    Widget build(BuildContext context) {
      String guest = widget.guestTeam;
      String home = widget.homeTeam;
      return SizedBox(
                height: 77,
                child: NeumorphicButton(
                  margin: const EdgeInsets.only(top: 6, left: 19, right: 19, bottom: 10),
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  style: const NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      lightSource: LightSource.topLeft,
                      color: DuncColors.mainBackground,
                      shadowDarkColor: DuncColors.shadowDark,
                      shadowLightColor: DuncColors.shadowLight,
                      depth: 4
                  ),
                  child: Row(
                    children: [
                      Container(
                        //color: Colors.amber,
                        width: 35,
                        child: Text(
                        '${widget.gameDate.month}/${widget.gameDate.day}',
                        style: const TextStyle(
                            color: DuncColors.indicatorImportant,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Noto Sans TC"
                        ),
                      ),),
                      const SizedBox(width: 20,),
                      widget.gametype(widget.gameType),
                      const SizedBox(width: 15,),
                      Text(
                        "$guest vs $home",
                        style: const TextStyle(
                            color: DuncColors.indicatorImportant,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Noto Sans TC'
                        ),
                      ),
                      const SizedBox(width: 5,),
                      NeumorphicButton(
                        style: const NeumorphicStyle(
                            disableDepth: true,
                            color: DuncColors.mainBackground
                        ),
                        // 搜尋按鈕的漸層
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                          ).createShader(bounds),
                          child: Icon(

                            (pressed == false)
                                ? Icons.notifications
                                : Icons.notifications_outlined,
                            size: 25,
                            color: Colors.white,  //required for gradient applying
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                             pressed = !pressed;
                          });
                        },
                      )
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                  settings: const RouteSettings(
                      arguments: 'example'
                  ),
                  builder: (context) => const MatchInfo()
              ));
                  },
                ),
              );          
    }
}

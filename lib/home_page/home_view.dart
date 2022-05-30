import 'package:dunc/bottombar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import './widget/Carousel.dart';
import './widget/gameCard.dart';
import './widget/postCard.dart';
import './widget/teamScore.dart';
import '../tools/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List post = ["貼文1", "貼文2", "貼文3", "貼文4", "貼文5"];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DuncColors.mainBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 75.0,
              width: 100,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 20.0,
                ),
                NeumorphicText(
                  "您關注的球隊現正比賽中!",
                  style: const NeumorphicStyle(
                    depth: 4, //customize depth here
                    color: Color.fromARGB(
                        255, 168, 79, 183), //customize color here
                  ),
                  textStyle: NeumorphicTextStyle(
                      fontSize: 25, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Carousel(),
            const SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20.0,
              ),
              const Icon(
                Icons.perm_media,
                size: 20.0,
              ),
              const SizedBox(
                width: 7,
              ),
              NeumorphicText(
                "最新貼文",
                style: const NeumorphicStyle(
                  depth: 4, //customize depth here
                  color: Color.fromARGB(255, 59, 58, 59), //customize color here
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 130,
              color: DuncColors.mainBackground,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: postCard(content: post[index]),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20.0,
              ),
              const Icon(
                Icons.sports_basketball,
                size: 20.0,
              ),
              const SizedBox(
                width: 7,
              ),
              NeumorphicText(
                "最新賽事",
                style: const NeumorphicStyle(
                  depth: 4, //customize depth here
                  color: Color.fromARGB(255, 59, 58, 59), //customize color here
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 20.0,
                ),
                Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 12,
                        lightSource: LightSource.topLeft,
                        color: DuncColors.mainBackground),
                    child: SizedBox(
                      height: 360,
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 30, top: 20),
                            child: NeumorphicText(
                              "4/27",
                              style: const NeumorphicStyle(
                                depth: 4, //customize depth here
                                color: Color.fromARGB(
                                    255, 59, 58, 59), //customize color here
                              ),
                              textStyle: NeumorphicTextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 70,
                                height: 20,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: DuncColors.playoffs,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              NeumorphicText(
                                "季後賽",
                                style: const NeumorphicStyle(
                                  depth: 4, //customize depth here
                                  color: Color.fromARGB(
                                      255, 59, 58, 59), //customize color here
                                ),
                                textStyle: NeumorphicTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: DuncColors.pointsMatch,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              NeumorphicText(
                                "積分賽",
                                style: const NeumorphicStyle(
                                  depth: 4, //customize depth here
                                  color: Color.fromARGB(
                                      255, 59, 58, 59), //customize color here
                                ),
                                textStyle: NeumorphicTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                color: DuncColors.allStar,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              NeumorphicText(
                                "明星賽",
                                style: const NeumorphicStyle(
                                  depth: 4, //customize depth here
                                  color: Color.fromARGB(
                                      255, 59, 58, 59), //customize color here
                                ),
                                textStyle: NeumorphicTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          const gameCard(
                              gameTime: "10:00",
                              gameType: "季後賽",
                              guestTeam: "地政",
                              homeTeam: "心理",
                              gameColor: "orange"),
                          const gameCard(
                              gameTime: "10:00",
                              gameType: "積分賽",
                              guestTeam: "資管",
                              homeTeam: "外交",
                              gameColor: "green"),
                          const gameCard(
                              gameTime: "12:00",
                              gameType: "明星賽",
                              guestTeam: "歐語",
                              homeTeam: "傳院",
                              gameColor: "blue"),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: TextButton(
                    child: NeumorphicText(
                                "查看更多...",
                                style: const NeumorphicStyle(
                                  depth: 4, //customize depth here
                                  color: Color.fromARGB(
                                      255, 59, 58, 59), //customize color here
                                ),
                                textStyle: NeumorphicTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(title: "", pageIndex: 0, searchIndex: 1)));},
                          )
                          )
                        ],
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20.0,
              ),
              const Icon(
                Icons.favorite,
                size: 20.0,
              ),
              const SizedBox(
                width: 7,
              ),
              NeumorphicText(
                "追蹤球隊",
                style: const NeumorphicStyle(
                  depth: 4, //customize depth here
                  color: Color.fromARGB(255, 59, 58, 59), //customize color here
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 20.0,
                ),
                Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 12,
                        lightSource: LightSource.topLeft,
                        color: DuncColors.mainBackground,),
                    child: SizedBox(
                      height: 260,
                      width: 350,
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 30, top: 20),
                            child: NeumorphicText(
                              "排名 : 積分賽",
                              style: const NeumorphicStyle(
                                depth: 4, //customize depth here
                                color: Color.fromARGB(
                                    255, 59, 58, 59), //customize color here
                              ),
                              textStyle: NeumorphicTextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Container(
                              //color: Colors.black,
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              width: 400,
                              height: 160,
                              child: Column(
                                children: const <Widget>[
                                  teamScore(team: '傳院', score: 0.9),
                                  teamScore(team: '資科', score: 0.7),
                                  teamScore(team: '法律', score: 0.6),
                                  teamScore(team: '應數', score: 0.5),
                                  teamScore(team: '經濟', score: 0.3),
                                  teamScore(team: '財政', score: 0.3)
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: TextButton(
                    child: NeumorphicText(
                                "查看更多...",
                                style: const NeumorphicStyle(
                                  depth: 4, //customize depth here
                                  color: Color.fromARGB(
                                      255, 59, 58, 59), //customize color here
                                ),
                                textStyle: NeumorphicTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(title: "", pageIndex: 0, searchIndex: 0)));},
                          )
                          )
                        ],
                      )),
                    )),
              ],
            ),
            const SizedBox(
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}

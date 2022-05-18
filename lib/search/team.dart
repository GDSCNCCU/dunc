import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';

Map<int, String> _rankTeam = {
  // 0-based
  0: '資科系',
  1: '資管系',
  2: '地政系',
  3: '公行系',
  4: '傳播學院',
  5: '應用數學系',
  6: '金融系',
  7: '經濟系',
  8: '財政系'
};

Set<String> _teamTrack = {};

List<Widget> teamWidgets(
    TextEditingController searchTextCtrl,
    double screenWidth,
    double screenHeight,
    State searchViewState
  )
{
  return [
    // 搜尋欄
    Stack(
      alignment: Alignment.center,
      children: [
        // 漸層外框
        Container(
          height: 57,
          width: screenWidth - 110,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo]
            ),
            borderRadius: BorderRadius.all(Radius.circular(40))
          ),
        ),
        // 輸入框
        Container(
          height: 51,
          width: screenWidth - 116,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: DuncColors.mainBackground
          ),
          alignment: Alignment.center,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: DuncColors.indicatorImportant),  //todo: 提示文字要不要暗點？
                hintText: "輸入球隊或球員名稱",
                // 搜尋按鈕的漸層
                suffixIcon: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                  ).createShader(bounds),
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,  //required for gradient applying
                  ),
                ),
                contentPadding: const EdgeInsets.only(top: 11, left: 23)
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            cursorColor: DuncColors.mainCTATo,
            style: const TextStyle(
              fontFamily: "Lexend",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: DuncColors.indicatorImportant
            ),
            controller: searchTextCtrl,
            onChanged: (str) {
              searchTextCtrl.text = str;
            }, //todo
          ),
        )
      ],
    ),
    const SizedBox(height: 48,),
    // 排名、追蹤文字
    Row(
      children: const [
        SizedBox(width: 36,),
        Text(
            '排名',
          style: TextStyle(
            color: DuncColors.indicatorImportant,
            fontSize: 14,
            fontFamily: "Noto Sans TC",
            fontWeight: FontWeight.w300
          ),
        ),
        Spacer(),
        Text(
          '追蹤',
          style: TextStyle(
              color: DuncColors.indicatorImportant,
              fontSize: 14,
              fontFamily: "Noto Sans TC",
              fontWeight: FontWeight.w300
          ),
        ),
        SizedBox(width: 57,)
      ],
    ),
    // 各個科系的排名
    SizedBox(
      height: screenHeight - 107 - 57 - 51 - 17,  // 高度到底部。但是以後一定會爆
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: 2 * _rankTeam.length - 1,
        itemBuilder: (context, i){
          if(i.isOdd){
            return const SizedBox(height: 8,);
          }
          final index = i ~/ 2;
          return SizedBox(
            height: 57,
            child: NeumorphicButton(
              margin: const EdgeInsets.only(top: 6, left: 19, right: 19),
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
                  Text(
                    '#${index+1}',
                    style: const TextStyle(
                        color: DuncColors.indicatorImportant,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Noto Sans TC"
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _rankTeam[index]!,
                    style: const TextStyle(
                      color: DuncColors.indicatorImportant,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Noto Sans TC'
                    ),
                  ),
                  const Spacer(),
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
                        // todo:追蹤中的icon不太一樣
                        _teamTrack.contains(_rankTeam[index])
                            ? Icons.subscriptions
                            : Icons.subscriptions_outlined,
                        size: 25,
                        color: Colors.white,  //required for gradient applying
                      ),
                    ),
                    onPressed: (){
                      searchViewState.setState((){
                        if(_teamTrack.contains(_rankTeam[index]!)){
                          _teamTrack.remove(_rankTeam[index]!);
                        }else{
                          _teamTrack.add(_rankTeam[index]!);
                        }
                      });
                    },
                  )
                ],
              ),
              onPressed: (){
                //todo:
              },
            ),
          );
        },
      ),
    ),
  ];
}
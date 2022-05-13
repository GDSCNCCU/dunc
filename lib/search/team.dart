import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';

List<Widget> teamWidgets(
    String searchText,
    void Function(String text) searchTextUpdater,
    double screenWidth
  )
{
  return [
    Neumorphic(
      // 搜尋
        margin: const EdgeInsets.only(
            left: 50, top: 12, right: 50, bottom: 12),
        style: NeumorphicStyle(
          color: DuncColors.mainBackground,
          depth: -3,
          intensity: 1,
          surfaceIntensity: 0,
          boxShape: NeumorphicBoxShape.roundRect(
              const BorderRadius.all(Radius.circular(40))),
        ),
        child: SizedBox(
          width: screenWidth- 100, // 扣掉margin、搜尋icon
          height: 46,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(color: DuncColors.indicatorImportant),  //todo: 提示文字要不要暗點？
                hintText: "輸入球隊或球員名稱",
                suffixIcon: ShaderMask(
                  // 搜尋按鈕的漸層
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
                contentPadding: const EdgeInsets.only(top: 13, left: 21)
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            autofocus: true,
            cursorColor: DuncColors.mainCTATo,
            style: const TextStyle(
                fontFamily: "GenSenRounded JP", fontSize: 16),
            controller: TextEditingController(text: searchText),
            onChanged: (str) {
              searchTextUpdater(str);
            }, //todo: unknown, waiting for UI
          ),
        )),
  ];
}
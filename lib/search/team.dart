import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';

List<Widget> teamWidgets(
    String searchText,
    void Function(String text) searchTextUpdater,
    double screenWidth
  )
{
  return [
    Stack(
      // 搜尋欄
      alignment: Alignment.center,
      children: [
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
                contentPadding: const EdgeInsets.only(top: 15, left: 23)
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.search,
            autofocus: true,
            cursorColor: DuncColors.mainCTATo,
            style: const TextStyle(
                fontFamily: "GenSenRounded JP",
                fontSize: 16,
              color: DuncColors.indicatorImportant
            ),
            controller: TextEditingController(text: searchText),
            onChanged: (str) {
              searchTextUpdater(str);
            }, //todo
          ),
        )
      ],
    ),
  ];
}
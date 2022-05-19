import 'package:dunc/tools/colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


final followingMatch = Row(
  children: <Widget>[
    const SizedBox(width: 24,),
    Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(11)), 
        depth: -3,
        lightSource: LightSource.topLeft,
        color: DuncColors.mainBackground,
        shadowLightColor: DuncColors.shadowLight,
        shadowDarkColor: DuncColors.shadowDark,
      ),
      child: Container(
        alignment: Alignment.center,
        width: 342,
        height: 121,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center ,
              child: const Icon(
                Icons.warning_amber_rounded,
                color: DuncColors.indicatorImportant,
                size: 27,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                '目前無追蹤球賽',
                style: TextStyle(
                  color: DuncColors.indicatorImportant,
                  fontSize: 20,
                  fontFamily: 'Noto Sans TC',
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                '請至搜尋功能查找比賽',
                style: TextStyle(
                  color: DuncColors.indicatorImportant,
                  fontSize: 12,
                  fontFamily: 'Noto Sans TC',
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
          ]
        ),
      ),
    ),
    const SizedBox(width: 24,),
  ],
);
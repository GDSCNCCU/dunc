import 'package:flutter/material.dart';

const purple = Color.fromRGBO(175, 87, 220, 1);

const secondPurple = Color.fromARGB(255, 187, 155, 204);

// 與新Figma上的顏色相同
class DuncColors {
  // 主要底色 Background #1
  static const Color mainBackground = Color(0xffe9ecf5);

  // 次要底色 Background #2
  static const Color secondaryBackground = Color(0xff3e3e3e);

  // 主要CTA Accent #1
  // 因此色設置為Linear，應使用LinearGradient這個Widget實現
  static const Color mainCTAFrom = Color(0xffaf57dc);
  static const Color mainCTATo = Color(0xff7b78e2);

  // 次要CTA Accent #2
  static const Color secondaryCTAPurple = Color(0xffbb9bcc);

  // 次要CTA Accent #3
  static const Color secondaryCTAWhite = Color(0xffffffff);

  // 標籤：季後賽
  static const Color playoffs = Color(0xffdc9656);

  // 標籤：積分賽
  static const Color pointsMatch = Color(0xffa5bca7);

  // 標籤：明星賽
  static const Color allStar = Color(0xff92a6ce);

  // 錯誤 Error
  static const Color error = Color(0xffb00020);

  // 其他 #000000
  static const Color other = Color(0xff000000);

  // Indicator (important)
  static const Color indicatorImportant = Color(0xff616161);

  // Indicator
  static const Color indicator = Color(0xffc0c0c0);
}
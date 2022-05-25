import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../tools/colors.dart';


class FollowingPlayer extends StatelessWidget {
  const FollowingPlayer({
    Key? key,
    required this.department,
    required this.num,
    required this.name,
  }) : super(key: key);

  final String department;
  final String num;
  final String name;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {},
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
          depth: 5,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(11)),
          color: DuncColors.mainBackground,
          shadowLightColor: DuncColors.shadowLight,
          shadowDarkColor: DuncColors.shadowDark,
      ),
      padding: const EdgeInsets.all(0),
      child: Container(
        width: 343,
        height: 60,
        padding: const EdgeInsets.all(0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(width: 29,),
            
            // 系所
            SizedBox(
              width: 45,
              height: 27,
              child: Text(
                department,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Noto Sans TC',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: DuncColors.secondaryBackground
                ),
              ),
            ),
            const SizedBox(width: 23,),

            // 號碼
            SizedBox(
              width: 18,
              height: 27,
              child: Text(
                num,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Noto Sans TC',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: DuncColors.secondaryBackground
                ),
              ),
            ),
            const SizedBox(width: 27,),

            // 名字
            SizedBox(
              width: 117,
              // height: 27,
              child: 
              Text(
                name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Noto Sans TC',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: DuncColors.secondaryBackground
                ),
              ),
            ),
            const SizedBox(width: 37,),
            
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: DuncColors.indicator,
            ),
            const SizedBox(width: 23,),

          ],
        ),
      ),
    );
  }
}
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../tools/colors.dart';


class FollowingTeam extends StatelessWidget {
  const FollowingTeam(this._name, {Key? key}) : super(key: key);

  final String _name;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 29,),
                Text(
                  _name,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans TC',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: DuncColors.secondaryBackground
                  ),
                ),
              ]
            ),
            Row(
              children: const <Widget>[
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: DuncColors.indicator,
                ),
                SizedBox(width: 23,),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
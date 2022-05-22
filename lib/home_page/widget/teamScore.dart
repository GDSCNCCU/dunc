import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '/tools/colors.dart';

class teamScore extends StatelessWidget {
  final String team;
  final dynamic score;
  // ignore: use_key_in_widget_constructors
  const teamScore({required this.team, required this.score});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DuncColors.mainBackground,
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //color: DuncColors.mainBackground,
              child: NeumorphicProgress(
              percent: score,
              style: const ProgressStyle(
                variant: Colors.purple,
              ),
            )),
            flex: 6,
          ),
          Expanded(
            child: NeumorphicText(
              team,
              style: const NeumorphicStyle(
                depth: 4, //customize depth here
                color: Color.fromARGB(255, 59, 58, 59), //customize color here
              ),
              textStyle: NeumorphicTextStyle(
                  fontSize: 12, fontWeight: FontWeight.w900),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}

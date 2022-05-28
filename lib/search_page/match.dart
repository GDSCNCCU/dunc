import 'package:dunc/search_page/game.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MatchWidgets extends StatelessWidget {
  const MatchWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [SizedBox(height: 10,), game()]);
  }
}

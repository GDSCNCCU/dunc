// ignore_for_file: camel_case_types

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '/tools/colors.dart';

class postCard extends StatelessWidget {
  final String content;
  // ignore: use_key_in_widget_constructors
  const postCard({required this.content});
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 18,
            intensity: 0.3,
            lightSource: LightSource.topLeft,
            color: DuncColors.mainBackground,),
        child: Container(
            width: 150,
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Image(
                      image: AssetImage("assets/cubl.jpg"), fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.purple,
                      size: 18.0,
                    ),
                    Text("154"),
                    SizedBox(
                      width: 75,
                    ),
                    Icon(
                      Icons.comment,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                  ],
                )
              ],
            )));
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:dunc/bottombar.dart';
import '../../tools/colors.dart';
import '../../tools/gradient_text.dart';
import '../../tools/gradient_icon.dart';


class AddFollowingButton extends StatefulWidget {
  const AddFollowingButton({Key? key}) : super(key: key);

  @override
  State<AddFollowingButton> createState() => _AddFollowingButtonState();
}

class _AddFollowingButtonState extends State<AddFollowingButton> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
          const BorderRadius.all(
            Radius.circular(40),
          )
        ),
        shadowLightColor: DuncColors.shadowLight,
        shadowDarkColor: DuncColors.shadowDark,
        depth: 5,
        intensity: 0.8,
      ),
      child: (!isOpen) ?
        // 未被打開時
        Container(
          padding: const EdgeInsets.all(0),
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              isOpen = true;
              setState(() {});
            },
            child: GradientIcon(
              Icons.add,
              60,
              const LinearGradient(colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo]),
            ),
            backgroundColor: DuncColors.mainBackground,
          ),
        ) : 
        // 被打開後
        Container(
          padding: const EdgeInsets.all(0),
          width: 80,
          height: 240,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            )
          ),
        child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                height: 80,
                width: 80,
                color: DuncColors.mainBackground,
                child: TextButton(
                  onPressed: () {
                    isOpen = false;
                    setState(() {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => 
                            BottomBar(title: "", pageIndex: 0, searchIndex: 1)
                        )
                      );
                    });
                  },
                  child: const GradientText(
                    '球賽',
                    gradient: LinearGradient(
                      colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                height: 80,
                width: 80,
                color: DuncColors.mainBackground,
                child: TextButton(
                  onPressed: () {
                    isOpen = false;
                    setState(() {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => 
                            BottomBar(title: "", pageIndex: 0, searchIndex: 0)
                        )
                      );
                    });
                  },
                  child: const GradientText(
                    '球員',
                    gradient: LinearGradient(
                      colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                height: 80,
                width: 80,
                color: DuncColors.mainBackground,
                child: TextButton(
                  onPressed: () {
                    isOpen = false;
                    setState(() {});
                  },
                  child: const GradientText(
                    '球隊',
                    gradient: LinearGradient(
                      colors: [DuncColors.mainCTAFrom, DuncColors.mainCTATo],
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), 
    );
  }
}

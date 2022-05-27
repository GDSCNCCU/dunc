import 'package:flutter_neumorphic/flutter_neumorphic.dart';

/// 在[selections]中做一個選擇。
///
/// 跟[NeumorphicToggle]不一樣之處在於那是左右滑動的，這個是按下去的
///
/// 預設會選擇第一項
class GroupedTextRadioButton extends StatefulWidget {
  const GroupedTextRadioButton({
    Key? key,
    this.radioStyle = const NeumorphicRadioStyle(),
    this.curve = Neumorphic.DEFAULT_CURVE,
    this.duration = Neumorphic.DEFAULT_DURATION,
    this.padding = EdgeInsets.zero,
    this.onChanged,
    this.isEnabled = true,
    required this.selections,
    this.selectedTextStyle = const TextStyle(),
    this.unSelectedTextStyle = const TextStyle(),
    this.selectedIndex = 0
  }) : super(key: key);

  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final NeumorphicRadioStyle radioStyle;
  final EdgeInsets padding;
  final Curve curve;
  final Duration duration;
  final void Function(int?)? onChanged;
  final bool isEnabled;
  final List<String?> selections;
  final int selectedIndex;

  @override
  State<GroupedTextRadioButton> createState() => _GroupedTextRadioButtonState();
}

class _GroupedTextRadioButtonState extends State<GroupedTextRadioButton> {
  int? selectedIndex;

  @override
  void initState(){
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        widget.selections.length,
        (radioIndex) => NeumorphicRadio(
          child: Text(
            widget.selections[radioIndex] ?? '',
            style: radioIndex == selectedIndex
              ? widget.selectedTextStyle
              : widget.unSelectedTextStyle,
            textAlign: TextAlign.center,
          ),
          style: widget.radioStyle,
          value: radioIndex,
          curve: widget.curve,
          duration: widget.duration,
          padding: widget.padding,
          groupValue: selectedIndex,
          onChanged: (index){
            // 按下已經按下的按鈕時index會是null
            if(widget.onChanged != null && index != null){
              selectedIndex = index as int;
              widget.onChanged!(index);
            }
          },
          isEnabled: widget.isEnabled,
        ),
        growable: false
      ),
    );
  }
}

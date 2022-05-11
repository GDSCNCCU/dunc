import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../tools/colors.dart';

double? _screenWidth;

void initMatch(double screenWidth){
  _screenWidth = screenWidth;
}

var matchWidgets = <Widget>[];
import '../tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'profile_view.dart';

final stacklayer = Stack(
  children: <Widget>[
    firstlayer,
    secondlayer,
  ],
);

final firstlayer = Row(
  children : <Widget> [
    const SizedBox(width: 28),
    
    // 照片
    SizedBox(
      width: 79,
      height: 79,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple[300]
        ),
      ),
    ),
    const SizedBox(width: 25,),

    // 名字
    SizedBox(
      height: 41,
      width: 149,
      child: Text(
        userName, textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: 'Noto Sans TC',
          color: DuncColors.secondaryBackground,
        ),
      ),
    ),
    const SizedBox(width: 40,),

    // 指示箭頭
    const SizedBox(
      child: IconButton(
        onPressed: nothing,
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: DuncColors.indicator,
        )
      )
    )
  ]
);

final secondlayer = Row(
  children: <Widget>[
    const SizedBox(width: 28,),
    SizedBox(
      height: 79, 
      width: 79,
      child: Container(
        alignment: Alignment.center,
        child: const Opacity(
          opacity: 0,
          child: IconButton(
            onPressed: nothing,
            icon: Icon(Icons.circle), 
            iconSize: 50,
          ),
        )
      )
    ),
  ],
);
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'profileview.dart';

final following_match = Row(
  children: <Widget>[
    const SizedBox(width: 24,),
    Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)), 
        depth: -5,
        lightSource: LightSource.topLeft,
        color: Colors.white70
      ),
      child: Stack(
        children: <Widget>[
          const SizedBox(height: 121, width: 342,),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 342,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30,),
                    Container(alignment: Alignment.center ,
                      child: Icon(Icons.warning_amber_rounded,color: Colors.purple[200],)
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: NeumorphicText( "目前無追蹤球隊",
                        style: NeumorphicStyle(
                          color: Colors.purple[300],
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: NeumorphicText( "請至搜尋功能查詢比賽",
                        style: NeumorphicStyle(
                          color: Colors.purple[300],
                        ),
                        textStyle: NeumorphicTextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
      ),
    ),
    const SizedBox(width: 24,),
  ],
);
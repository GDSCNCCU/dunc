import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'profileview.dart';

final stacklayer = Stack(
  children: <Widget>[
    firstlayer,
    secondlayer,
  ],
);

final firstlayer = Row(
  children : <Widget> [
    const SizedBox(width: 28),
    SizedBox(
      width: 97,
      height: 97,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purple[300]
        ),
        // color: Colors.amber,
      ),
    ),
    const SizedBox(width: 23,),
    SizedBox(
      height: 33,
      width: 149,
      child: Text(
        user_name, textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const SizedBox(width: 40,),
    const SizedBox(
      child: IconButton(onPressed: nothing, icon: Icon(Icons.arrow_forward_ios_rounded))
    )
  ]
);

final secondlayer = Row(
  children: <Widget>[
    SizedBox(width: 28,),
    SizedBox(
      height: 97, width: 97,
      child: Container(alignment: Alignment.center,
        child: const Opacity(opacity: 0,
          child: IconButton(onPressed: nothing,
            icon: Icon(Icons.circle), iconSize: 50,
          ),
        )
      )
    ),
  ],
);
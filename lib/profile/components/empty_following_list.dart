import '../../tools/colors.dart';

import 'package:flutter/material.dart';


class EmptyFollowingList extends StatelessWidget {
  const EmptyFollowingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 208,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Icon(
              Icons.warning_amber_rounded,
              color: DuncColors.indicatorImportant,
              size: 30,
            ),
          ),
          Container(
            // width: 204,
            height: 36,
            alignment: Alignment.center,
            child: const Text(
              '目前無追蹤球隊/球員',
              style: TextStyle(
                color: DuncColors.indicatorImportant,
                fontSize: 20,
                fontFamily: 'Noto Sans TC',
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              '請至搜尋功能查詢球隊',
              style: TextStyle(
                color: DuncColors.indicatorImportant,
                fontSize: 12,
                fontFamily: 'Noto Sans TC',
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ]
      ),
    );
  }
}
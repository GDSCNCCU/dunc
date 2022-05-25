import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'profile_page/profile_view.dart';
import 'search_page/search_view.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'dUNC',
      home: SearchView(),
      // home: ProfileView(),
    );

    // 測試ProfileView
    // 非正式
    // return const MaterialApp(
    //   home: ProfileView(),
    // );
  }
}



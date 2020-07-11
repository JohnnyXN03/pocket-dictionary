import 'package:dictionary/screens/alllang.dart';
import 'package:dictionary/screens/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: HomePage(),

      routes: {
        '/': (context) => HomePage(),
        '/first': (context) => Native(),
        '/second': (context) => LangList()
      },
    );
  }
}

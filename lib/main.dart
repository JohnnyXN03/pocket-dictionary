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
    //  theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //  home: HomePage(),

      routes: {
        '/': (context) => HomePage(),
        //  '/first': (context) => Native(),
        //  '/second': (context) => LangList()
      },
    );
  }
}

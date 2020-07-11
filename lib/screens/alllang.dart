import 'package:flutter/material.dart';

class LangList extends StatefulWidget {
  @override
  _LangListState createState() => _LangListState();
}

class _LangListState extends State<LangList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native search'),
      ),
      body: Container(
        child: Center(
          child: Text('Under process'),
        ),
      ),
    );
  }
}

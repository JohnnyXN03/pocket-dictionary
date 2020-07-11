import 'package:flutter/material.dart';

class Native extends StatefulWidget {
  @override
  _NativeState createState() => _NativeState();
}

class _NativeState extends State<Native> {
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

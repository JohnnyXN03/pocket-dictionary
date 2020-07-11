import 'package:dictionary/screens/native.dart';
import 'package:flutter/material.dart';

class Model extends StatelessWidget {
  // grid elemejnt design
  final String lang;
  Model({this.lang});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: 0.3),
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Native()));
            }, //.................................................. card tap here
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.transparent,
            child: Text(
              lang,
              style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}

import 'package:dictionary/screens/alllang.dart';
import 'package:dictionary/screens/model/model.dart';

import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Color(0xff586F7C),
          child: Text('Translate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.done,
                      color: Colors.black,
                    ),
                    onPressed:
                        () {}), //.................................................. translator function
                hintText: 'Type anything and Translate',
                contentPadding: EdgeInsets.all(15),
                hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
                isDense: true),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Color(0xff586F7C),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: 65,
          child: Text('Native search',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
        GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          shrinkWrap: true,
          children: <Widget>[
            Model(
              lang: 'Hindi',
            ),
            Model(
              lang: 'French',
            ),
            Model(
              lang: 'Marathi',
            ),
            Model(
              lang: 'Kannada',
            ),
            Model(
              lang: 'Japanese',
            ),
            Model(
              lang: 'Korean',
            ),
            Model(
              lang: 'Spanish',
            ),
            Model(
              lang: 'Tamil',
            ),
            Model(
              lang: 'Telgu',
            ),
          ],
          physics: BouncingScrollPhysics(),
        ),
        FlatButton(
            color: Colors.black54,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LangList()));
            },
            child: Text(
              'View all',
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            )),
      ],
    );
  }
}

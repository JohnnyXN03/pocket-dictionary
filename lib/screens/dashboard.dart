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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Color(0xff1E272E),
          child: Text('Translate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              )),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    onPressed:
                        () {}), //.................................................. translator function
                hintText: 'Type anything and Translate',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: EdgeInsets.all(10),
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
                isDense: true),
          ),
        ),
        Container(
            color: Color(0xff1E272E),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height:
                300, //........................................................ change here to grid view or action chips
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Native search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Model(
                      lang: 'Hindi',
                    ),
                    Model(
                      lang: 'French',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Model(
                      lang: 'Marathi',
                    ),
                    Model(
                      lang: 'Kannada',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Model(
                      lang: 'German',
                    ),
                    Model(
                      lang: 'Japanese',
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}

class Model extends StatelessWidget {
  final String lang;
  Model({this.lang});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          height: 50,
          child: RaisedButton(
            onPressed:
                () {}, //.................................................. card tap here
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Text(
              lang,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ));
  }
}

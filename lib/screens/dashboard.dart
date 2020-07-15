import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List _items = [
    "Hindi",
    "English",
    "Bengali",
    "Punjabi",
    "Gujarati",
    "Arabic",
    "Punjabi",
    "Kannada",
    "Tamil",
    "Finnish",
    "French",
    "German",
    "Greek",
    "Indonesian",
    "Italian",
    "Japanese",
    "Korean",
    "Malayalam",
    "Marathi",
    "Russian",
    "Spanish",
    "Swedish",
    "Tamil",
    "Telugu",
    "Urdu",
    "Sindhi",
  ];
  String out;
  GoogleTranslator translator = GoogleTranslator();
  void translate() {
    translator
        .translate(_textEditingController.text, to: 'hi')
        .then((value) => showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
                content: Text(value.toString()),
              );
            }));
  }

  TextEditingController _edit = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Quote of the Day',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Text('Keep calm and do your work\n -Jatin',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                  )),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.all(5),
              child: Text('Native search',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _edit,
                autovalidate: true,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: IconButton(
                      icon: IconButton(
                        icon: Icon(
                          Icons.keyboard_voice,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      onPressed: null),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      onPressed:
                          () {}), //  ....................native search here
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 0.5)),
                  border: InputBorder.none,
                  hintText: 'Type your native language',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.all(5),
              child: Text('Translate',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: _textEditingController,
                autovalidate: true,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.keyboard_voice),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                child: ListView(
                                  children: <Widget>[
                                    ListTile(
                                      onTap: () {
                                        translate();
                                      },
                                      title: Text(
                                        'Hindi',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        translate();
                                      },
                                      title: Text(
                                        'Hindi',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        translate();
                                      },
                                      title: Text(
                                        'Hindi',
                                        style: TextStyle(
                                            fontFamily: 'Raleway',
                                            fontSize: 13,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }), //  ...>.................translator here
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white, width: 0.5)),
                  border: InputBorder.none,
                  hintText: 'Type anything and translate',

                  filled: false,
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

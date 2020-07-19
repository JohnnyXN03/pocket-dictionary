import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:share_it/share_it.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List meaning;

  TextEditingController _edit = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  List<String> _items = [
    "Hindi",
    "Bengali",
    "Punjabi",
    "Gujarati",
    "Arabic",
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
    "Telugu",
    "Urdu",
    "Sindhi",
    "English",
    "Oriya",
    "Nepali"
  ];
  List<String> _list = [
    "hi",
    "bn",
    "pa",
    "ga",
    "ar",
    "kn",
    "ta",
    "fi",
    "fr",
    "de",
    "el",
    "id",
    "it",
    "ja",
    "ko",
    "ml",
    "mr",
    "ru",
    "es",
    "sv",
    "te",
    "ur",
    "sd",
    "en",
    "or",
    "ne"
  ];
  GoogleTranslator translator = GoogleTranslator();
  void translate(String code) {
    translator
        .translate(_textEditingController.text, to: code)
        .then((value) => showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: value));
                      }), //................copy to clipborad
                  IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        ShareIt.text(
                            content: value,
                            androidSheetTitle: _textEditingController.text);
                      }), //..........................share to whats up
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
                content: SelectableText(
                  value.toString(),
                  style: TextStyle(
                      fontFamily: 'Raleway', fontWeight: FontWeight.w400),
                ),
              );
            }));
  }

  Future fetchmeaning(String ind) async {
    var translate = await translator.translate(_edit.text,
        to: ind); //...........transltesd funtion.
    var response = await http.get(
        'http://api.dictionaryapi.dev/api/v1/entries/' + ind + '/' + translate);
    return response.body;

    //   setState(() {
    //    meaning = json.decode(response.body);
    //   });
    //return function here
    // return
  }

  @override
  // ignore: unused_element
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
                                  child: Center(
                                    child: ListView.builder(
                                      itemBuilder: (ctx, index) {
                                        return InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    child: FutureBuilder(
                                                      builder: (context, snap) {
                                                        if (snap.hasData ==
                                                            null) {
                                                          return Container(
                                                            child:
                                                                Text('No data'),
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          //..................................work here
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    _edit.text),
                                                                Text(snap.data[
                                                                        'meaning']
                                                                        [index][
                                                                        'definition']
                                                                    .toString()),
                                                              ],
                                                            );
                                                          },
                                                          itemCount: 5,
                                                        );
                                                      },
                                                      future: fetchmeaning(
                                                          _list.toString()),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              margin: EdgeInsets.only(
                                                  left: 6, right: 6),
                                              elevation: 1,
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Text(
                                                    _items[index].toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 21),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: 25,
                                      shrinkWrap: true,
                                    ),
                                  ));
                            }); //....................translater functions here
                      }), //  ....................native search here
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
                                  child: Center(
                                    child: ListView.builder(
                                      itemBuilder: (ctx, index) {
                                        return InkWell(
                                          onTap: () {
                                            translate(_list[index].toString());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                              margin: EdgeInsets.only(
                                                  left: 6, right: 6),
                                              elevation: 1,
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Text(
                                                    _items[index].toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 21),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: 25,
                                      shrinkWrap: true,
                                    ),
                                  ));
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

import 'dart:async';
import 'dart:convert';

import 'package:dictionary/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController _streamController = StreamController();
  Stream _stream;
  Timer timer;
  TextEditingController _input = TextEditingController();
  String _url = 'https://owlbot.info/api/v4/dictionary/';
  String _id = 'f54f7ebb212e7b91e6c162fcb910723dbb83031a';

  _searchword() async {
    if (_input.text == null || _input.text.length == 0) {
      _streamController.add(null);
      return;
    } else {
      _streamController.add("waiting");
      Response response = await get(_url + _input.text.trim(),
          headers: {"Authorization": "Token " + _id});
      print(response.body);
      if (response.body.contains('[{"message":"No definition :("}]')) {
        _streamController.add('NoData');
        return;
      } else {
        _streamController.add(json.decode(response.body));
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed:
              () {}, //.........................................scan and translate here
          label: Text('Scan and Translate'),
          isExtended: true,
          icon: Icon(Icons.camera_alt),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Dictionary',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          bottom: PreferredSize(
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                margin:
                    EdgeInsets.only(left: 12, bottom: 10, right: 12, top: 2),
                child: TextFormField(
                  controller: _input,
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    if (timer?.isActive ?? false) timer.cancel();
                    timer = Timer(Duration(milliseconds: 1000), () {
                      //seach function
                    });
                  },
                  autocorrect: true,
                  autovalidate: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.black87),
                          onPressed: () {
                            _searchword();
                          }),
                      hintText: 'Type and search',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Raleway',
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      isDense: false,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(48),
          ),
        ),
        body: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Dashboard(), // Dash() // dash board here
              );
            }

            if (snapshot.data == "waiting") {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              );
            }
            if (snapshot.data == 'NoData') {
              return Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    'Enter something meaningful',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 23,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              );
            }

            return Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data["definitions"]
                    .length, // ..................................... action dialoge box here..... generic dialouge box
                itemBuilder: (BuildContext context, int index) {
                  return ListBody(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        color: Colors
                            .black, //...................................add if condition here
                        child: Text(
                            _input.text.trim() +
                                "  (" +
                                snapshot.data["definitions"][index]["type"] +
                                ")",
                            style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w400,
                                fontSize: 21)),
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(14),
                        child: Text(
                            snapshot.data["definitions"][index]["definition"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Raleway',
                            )),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

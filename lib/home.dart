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
  String _url = 'https://owlbot.info/api/v4/dictionary/';
  String _id = 'f54f7ebb212e7b91e6c162fcb910723dbb83031a';
  TextEditingController _input = TextEditingController();
  StreamController _streamController;
  Stream _stream;
  Timer _timer;

  _searchword() async {
    if (_input.text == null || _input.text.length == 0) {
      _streamController.add(null);
      return;
    }

    _streamController.add("waiting");
    Response response = await get(_url + _input.text.trim(),
        headers: {"Authorization": "Token " + _id});

    _streamController.add(json.decode(response.body));
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
      backgroundColor: Color(0xff1E272E),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Process',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.black),
            )
          ],
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[],
        title: Text(
          'Pocket Dictionary',
          style: TextStyle(
              fontSize: 23, color: Colors.white, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff1E272E),
        bottom: PreferredSize(
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white),
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  onChanged: (String text) {
                    if (_timer?.isActive ?? false) _timer.cancel();
                    _timer = Timer(const Duration(milliseconds: 1000), () {
                      _searchword();
                    });
                  },
                  controller: _input,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            _searchword();
                          }),
                      hintText: 'Type and search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      isDense: false),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(50)),
      ),
      body: SingleChildScrollView(
        //...................................................remove this scroll view
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(child: Dash() // dash board here
                    );
              }

              if (snapshot.data == "waiting") {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  ),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data["definitions"]
                    .length, // ..................................... action dialoge box here..... generic dialouge box
                itemBuilder: (BuildContext context, int index) {
                  return ListBody(
                    children: <Widget>[
                      Container(
                        color: Colors.black,
                        child: ListTile(
                          leading: snapshot.data["definitions"][index]
                                      ["image_url"] ==
                                  null
                              ? null
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data["definitions"][index]["image_url"]),
                                ),
                          title: Text(
                            _input.text.trim() +
                                "  (" +
                                snapshot.data["definitions"][index]["type"] +
                                ")",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data["definitions"][index]["definition"],
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    ));
  }
}

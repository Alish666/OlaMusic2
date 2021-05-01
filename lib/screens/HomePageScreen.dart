import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String value = '';
  var url = Uri.parse(
      'https://olamusic-default-rtdb.firebaseio.com/instruments.json');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(249, 247, 243, 1),
          title: Center(
            child: Text(
              "oLA",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text("press"),
              onPressed: () {
                FirebaseAuth.instance.authStateChanges().listen((User user) {
                  if (user == null) {
                    print('no user signed in');
                  } else {
                    print(user.uid + '  AND  ' + user.email);
                  }
                });
              },
            ),
            Text(value)
          ],
        ));
  }
}

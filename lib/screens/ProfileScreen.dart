import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:expansion_card/expansion_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        body: Card(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Text(
                ' d',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              )
            ],
          ),
        ));
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/widgets/Advert.dart';
import 'package:olamusic/widgets/HomePageSlider.dart';
import 'package:olamusic/widgets/HomePageVideoPlayer.dart';
import 'package:olamusic/widgets/Popular.dart';
import 'package:olamusic/widgets/Recomendation.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Center(
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'oLA ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                TextSpan(
                    text: 'Music',
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20))
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            HomePageSlider(),
            HomePageVideoPlayer(),
            SizedBox(
              height: 10,
            ),
            Advert(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Popular",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            SizedBox(
              height: 15,
            ),
            Popular(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Recomendation",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            SizedBox(
              height: 15,
            ),
            Recomendation()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:olamusic/widgets/FilterItem.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        shadowColor: Colors.orange[50],
        title: Center(
          child: Text(
            "oLA",
            style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
      ),
      body: FilterItem(),
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
    );
  }
}

// Color.fromRGBO(249, 247, 243, 1)

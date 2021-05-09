import 'package:flutter/material.dart';
import 'package:olamusic/widgets/FilterItem.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: FilterItem(),
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
    );
  }
}

// Color.fromRGBO(249, 247, 243, 1)

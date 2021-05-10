import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/user.dart';
import 'package:provider/provider.dart';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<OlaUser>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "No Orders yet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              LineIcons.frowningFace,
              size: 70,
            )
          ],
        ),
      ),
    );
  }
}

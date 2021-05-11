import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/card.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:provider/provider.dart';

class PasswordChange extends StatelessWidget {
  TextEditingController email =
      TextEditingController(text: FirebaseAuth.instance.currentUser.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Password Change',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.black, // set border color
                    width: 1.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.bold),
                enabled: false,
                controller: email,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () async {
                _showMyDialog(context, email.text);
              },
              child: Text(
                'Reset Password',
                style: TextStyle(
                    color: Colors.yellow[900],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String email) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Confirm Password Reset'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[700]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'RESET',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email);

                Provider.of<Data>(context, listen: false).clearStarred();
                Provider.of<OlaUser>(context, listen: false).clearData();
                Provider.of<DataCard>(context, listen: false).clearData();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                _resetConfirmed(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _resetConfirmed(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Password reset details is sent'),
                Text('To your email address!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

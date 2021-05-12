import 'package:animated_button/animated_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthReset extends StatefulWidget {
  @override
  _AuthResetState createState() => _AuthResetState();
}

class _AuthResetState extends State<AuthReset> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'oLA ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50)),
                          TextSpan(
                            text: 'Music',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Center(
                      child: DefaultTextStyle(
                        style: GoogleFonts.novaFlat(
                            fontSize: 42,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Get any instrument',
                              speed: Duration(milliseconds: 55),
                            ),
                            TypewriterAnimatedText(
                              'Of high quality',
                              speed: Duration(milliseconds: 55),
                            ),
                            TypewriterAnimatedText(
                              'In Our Shop!',
                              speed: Duration(milliseconds: 55),
                            ),
                            TypewriterAnimatedText(
                              'Fast and Cheap',
                              speed: Duration(milliseconds: 55),
                            ),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 188, 44, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password Reset",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please enter your email address",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        primaryColor: Colors.black,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value.length < 2) {
                            return 'Enter at least 2 chars!';
                          } else if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Enter email!';
                          } else {
                            return null;
                          }
                        },
                        autofocus: false,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[350], width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[350], width: 1),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        controller: email,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: AnimatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email.text);
                            } on FirebaseAuthException catch (e) {
                              print(e.code);
                            }
                            Navigator.of(context).pop();
                            _resetConfirmed(context);
                          }
                        },
                        child: Text(
                          "RESET",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        height: 60,
                        width: 300,
                        color: Color.fromRGBO(255, 188, 44, 1),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            email.clear();
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Return Back",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

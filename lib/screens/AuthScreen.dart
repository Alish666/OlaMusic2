import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  bool showLogIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "Login to your account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email address'),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              controller: emailController,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: passwordController,
            ),
            showLogIn
                ? logInWidget(context)
                : registerWidget(context, confirmPasswordController),
          ],
        ),
      ),
    );
  }

  Widget logInWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        AnimatedButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
            FirebaseAuth.instance.authStateChanges().listen((User user) {
              if (user == null) {
                print('no!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
              } else {
                print('YYYYYYYEEEEEEEEEEEEEEEEEEEEEEEESSSSSSSSSSSS!!!!!!!!!!!');
              }
            });
            setState(() {
              emailController.clear();
              passwordController.clear();
            });
          },
          child: Text(
            "LOG IN",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          height: 60,
          width: 375,
          color: Color.fromRGBO(255, 188, 44, 1),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: <Widget>[
            Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    showLogIn = false;
                    emailController.clear();
                    passwordController.clear();
                  });
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(255, 188, 44, 1)),
                ))
          ],
        )
      ],
    );
  }

  Widget registerWidget(
      BuildContext context, TextEditingController textEditingController) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Confirm Password'),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          controller: textEditingController,
        ),
        SizedBox(
          height: 16,
        ),
        AnimatedButton(
          onPressed: () async {
            try {
              UserCredential userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }
            setState(() {
              emailController.clear();
              passwordController.clear();
            });
          },
          child: Text(
            "REGISTER",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          height: 60,
          width: 375,
          color: Color.fromRGBO(255, 188, 44, 1),
        ),
        Row(
          children: <Widget>[
            Text(
              "Already have an account?",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    showLogIn = true;
                    emailController.clear();
                    passwordController.clear();
                  });
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(255, 188, 44, 1)),
                ))
          ],
        )
      ],
    );
  }
}

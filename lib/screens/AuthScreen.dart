import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/screens/AuthReset.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isShown = true;
  bool isShown2 = true;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  bool showLogIn = true;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  showLogIn ? "Sign In" : "Create an account",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  showLogIn ? "Please sign in to continue" : "",
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

                    ///////////////////////////////////////////////////////////////  1
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
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.black,
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 2) {
                        return 'Enter at least 2 chars!';
                      } else if (value == null || value.isEmpty) {
                        return 'Enter password!';
                      } else {
                        return null;
                      }
                    },
                    autofocus: false,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ////////////////////////////////////////////////// 2
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isShown ? Icons.remove_red_eye : Icons.security,
                          color: Color.fromRGBO(255, 188, 44, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            isShown = !isShown;
                          });
                        },
                      ),
                      labelText: 'Password',
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShown,
                    controller: passwordController,
                  ),
                ),
                showLogIn
                    ? logInWidget(context)
                    : registerWidget(context, confirmPasswordController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logInWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 26,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AnimatedButton(
              shape: BoxShape.rectangle,
              onPressed: () => signInWithGoogle(),
              child: Icon(
                LineIcons.googlePlusG,
                color: Colors.white,
                size: 32,
              ),
              width: 60,
              height: 60,
              color: Color.fromRGBO(204, 66, 55, 1),
            ),
            AnimatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      _showError(context, 'No user found for that email!');
                    } else if (e.code == 'wrong-password') {
                      _showError(
                          context, 'Wrong password provided for that user!');
                    }
                  }
                }

                FirebaseAuth.instance.authStateChanges().listen((User user) {
                  if (user == null) {
                    print(
                        'NNNNOOOOOOOOOOOOOOOOOOOOO!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                  } else {
                    print(
                        'YYYYYYYEEEEEEEEEEEEEEEEEEEEEEEESSSSSSSSSSSS!!!!!!!!!!!');
                  }
                });
                setState(() {
                  emailController.clear();
                  passwordController.clear();
                });
              },
              child: Text(
                "SIGN IN",
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
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  emailController.clear();
                  passwordController.clear();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthReset()),
                );
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 188, 44, 1)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ),
                ),
              ],
            ),
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
        Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
          ),
          child: TextFormField(
            validator: (value) {
              if (value.length < 2) {
                return 'Enter at least 2 chars!';
              } else if (value == null || value.isEmpty) {
                return 'Invalid Input!';
              } else if (passwordController.text != value) {
                return 'Passwords do not match!';
              } else {
                return null;
              }
            },
            autofocus: false,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ////////////////////////////////////////////////// 2
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isShown ? Icons.remove_red_eye : Icons.security,
                  color: Color.fromRGBO(255, 188, 44, 1),
                ),
                onPressed: () {
                  setState(() {
                    isShown2 = !isShown2;
                  });
                },
              ),
              labelText: 'Confirm Password',
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350], width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[350], width: 1),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isShown2,
            controller: confirmPasswordController,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        AnimatedButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  _showError(context, 'Provided password is weak!');
                } else if (e.code == 'email-already-in-use') {
                  _showError(context, "Email account already in use!");
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
              });
            }
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
          mainAxisAlignment: MainAxisAlignment.center,
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

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> _showError(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  LineIcons.exclamationTriangle,
                  color: Colors.red,
                  size: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  message,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.yellow[900])),
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

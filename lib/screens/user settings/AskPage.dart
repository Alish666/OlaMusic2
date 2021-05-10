import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/user.dart';
import 'package:provider/provider.dart';

class AskPage extends StatefulWidget {
  @override
  _AskPageState createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController name;
  TextEditingController email;
  TextEditingController topic;
  TextEditingController text;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      name =
          TextEditingController(text: Provider.of<OlaUser>(context).nameText);
      email =
          TextEditingController(text: FirebaseAuth.instance.currentUser.email);
      topic = TextEditingController();
      text = TextEditingController();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Ask Question',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Enter at least 2 chars!';
                    } else if (value == null || value.isEmpty) {
                      return 'Invalid Input!';
                    } else {
                      return null;
                    }
                  },
                  controller: name,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Enter at least 2 chars!';
                    } else if (value == null || value.isEmpty) {
                      return 'Invalid Input!';
                    } else {
                      return null;
                    }
                  },
                  controller: email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Enter at least 2 chars!';
                    } else if (value == null || value.isEmpty) {
                      return 'Invalid Input!';
                    } else {
                      return null;
                    }
                  },
                  controller: topic,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Topic Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 10,
                  validator: (value) {
                    if (value.length < 2) {
                      return 'Enter at least 2 chars!';
                    } else if (value == null || value.isEmpty) {
                      return 'Invalid Input!';
                    } else {
                      return null;
                    }
                  },
                  controller: text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Message Body',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      name.clear();
                      email.clear();
                      topic.clear();
                      text.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromRGBO(25, 25, 25, 1),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            'Message is Sent!',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.yellow[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

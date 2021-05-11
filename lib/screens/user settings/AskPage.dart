import 'package:cloud_firestore/cloud_firestore.dart';
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
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    sendRequest(
                            name1: name.text,
                            email1: email.text,
                            topicName1: topic.text,
                            body1: text.text)
                        .then(
                      (value) {
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
                    );
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                        color: Colors.yellow[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendRequest(
      {@required String name1,
      @required String email1,
      @required String topicName1,
      @required String body1}) async {
    final fb = FirebaseFirestore.instance.collection('questions/');
    var userId = FirebaseAuth.instance.currentUser.uid;
    await fb
        .add({
          'name': name1,
          'email': email1,
          'topicName': topicName1,
          'body': body1
        })
        .then((value) => print("Surname is set!"))
        .catchError((error) => print(error));
  }
}

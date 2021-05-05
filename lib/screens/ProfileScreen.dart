import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/screens/user%20settings/FrontLayer.dart';
import 'package:olamusic/widgets/RecomendedList.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:backdrop/backdrop.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<OlaUser>(context);

    return BackdropScaffold(
      frontLayerBackgroundColor: Color.fromRGBO(249, 247, 243, 1),
      resizeToAvoidBottomInset: false,
      backLayerBackgroundColor: Colors.black,
      appBar: BackdropAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          userData.nameText == 'q' ? "Settings" : userData.nameText,
          style: TextStyle(fontSize: 25),
        ),
        actionsIconTheme: IconThemeData(color: Colors.red),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.close_menu,
          )
        ],
      ),
      backLayer: SingleChildScrollView(
        ////////////////////////////////////////////// BAAAAAAAAAAAACCCCKKKKKKKKKKK LAAAAAAAAAAYYYYYYEEEEEEEEEERRRRRRRRRR
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    minRadius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color.fromRGBO(255, 188, 44, 1),
                      size: 65,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        userData.email,
                        style: TextStyle(fontSize: 13, color: Colors.grey[350]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        userData.nameText == 'q'
                            ? "Username"
                            : userData.nameText,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white,
                thickness: 0.5,
              ),
              Form(
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
                      controller: userData.name,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
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
                      controller: userData.surname,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Surname',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
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
                      maxLength: 15,
                      keyboardType: TextInputType.phone,
                      controller: userData.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Number',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.length < 2) {
                          return 'Enter at least 10 chars!';
                        } else if (value == null || value.isEmpty) {
                          return 'Invalid Input!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      controller: userData.country,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Country',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
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
                      keyboardType: TextInputType.phone,
                      controller: userData.city,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'City',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
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
                      keyboardType: TextInputType.phone,
                      controller: userData.address,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Address',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      userData.setUserInfo(
                          name: userData.nameText,
                          surname: userData.surnameText,
                          number: userData.numberText,
                          country: userData.countryText,
                          city: userData.cityText,
                          address: userData.addressText);
                    }
                  },
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(255, 188, 44, 1),
                    ),
                  ))
            ],
          ),
        ),
      ),
      frontLayer: FrontLayer(),
    );
  }
}

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:octo_image/octo_image.dart';
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
                  GestureDetector(
                    onTap: () =>
                        _showAvatars(context: context, userData: userData),
                    child: OctoImage(
                      image: AssetImage('assets/${userData.avatar}.png'),
                      height: 80,
                      width: 80,
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
                      _showResult(
                          context: context,
                          message: "Data has been successfully saved!",
                          icon: LineIcons.checkCircle,
                          color: Colors.green);
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

  Future<void> _showResult(
      {@required BuildContext context,
      @required String message,
      @required IconData icon,
      @required Color color}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
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

  Future<void> _showAvatars(
      {@required BuildContext context, @required OlaUser userData}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              children: [
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/bear.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('bear');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/cat.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('cat');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/dog.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('dog');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/fox.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('fox');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/horse.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('horse');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/owl.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('owl');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/penguin.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('penguin');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: OctoImage(
                    image: AssetImage('assets/pig.png'),
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    userData.setAvatar('pig');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK',
                  style: TextStyle(color: Colors.yellow[900], fontSize: 18)),
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

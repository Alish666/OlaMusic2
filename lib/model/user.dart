import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OlaUser with ChangeNotifier {
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();

  String _uid;
  String _url;
  String _avatar = 'bear';
  String get uid => FirebaseAuth.instance.currentUser.uid;

  String get nameText {
    return _name.text.isEmpty ? 'q' : _name.text;
  }

  String get surnameText => _surname.text;
  String get numberText => _phone.text;
  String get countryText => _country.text;
  String get cityText => _city.text;
  String get addressText => _address.text;
  String get avatar => _avatar;

  TextEditingController get name => _name;
  TextEditingController get surname => _surname;
  TextEditingController get number => _phone;
  TextEditingController get country => _country;
  TextEditingController get city => _city;
  TextEditingController get address => _address;

  String get url => _url;
  String get email => FirebaseAuth.instance.currentUser.email;

  void setAvatar(String value) {
    _avatar = value;
    notifyListeners();
  }

  Future<void> setUserInfo(
      {@required String name,
      @required String surname,
      @required String number,
      @required String country,
      @required String city,
      @required String address}) async {
    final fb = FirebaseFirestore.instance.collection('users/');
    _name.text = name;
    _surname.text = surname;
    _phone.text = number;
    _country.text = country;
    _city.text = city;
    _address.text = address;
    notifyListeners();

    var userId = FirebaseAuth.instance.currentUser.uid;

    await fb
        .doc('$userId')
        .set({
          'name': name,
          'surname': surname,
          'number': number,
          'country': country,
          'city': city,
          'address': address,
          'avatar': _avatar
        })
        .then((value) => print("User data is set!"))
        .catchError((error) => print(error));
    initUser();
  }

  Future<void> initUser() async {
    final fb = FirebaseFirestore.instance.collection('users/');
    var userId = FirebaseAuth.instance.currentUser.uid;
    var dataFetch = await fb.doc('$userId').get();

    String name1 = await dataFetch.data()['name'];
    String surname1 = await dataFetch.data()['surname'];
    String number1 = await dataFetch.data()['number'];
    String country1 = await dataFetch.data()['country'];
    String city1 = await dataFetch.data()['city'];
    String address1 = await dataFetch.data()['address'];
    String avatar1 = await dataFetch.data()['avatar'];

    _name.text = name1;
    _surname.text = surname1;
    _phone.text = number1;
    _country.text = country1;
    _city.text = city1;
    _address.text = address1;
    _avatar = (avatar1 == null || avatar1.isEmpty || avatar1 == '')
        ? 'bear'
        : avatar1;

    notifyListeners();
    print('NAME IS ---------------' + _name.text);
  }

  void clearData() {
    _name.clear();
    _surname.clear();
    _phone.clear();
    _country.clear();
    _city.clear();
    _address.clear();
    notifyListeners();
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class OlaUser with ChangeNotifier {
//   String _uid = '';
//   String _name = '';
//   String _surname = '';
//   String _email = '';
//   String _number = '';
//   bool _gender = true;
//   String _country = '';
//   String _city = '';
//   String _address = '';
//   String _url = '';

//   String get uid => FirebaseAuth.instance.currentUser.uid;
//   String get name {
//     return FirebaseAuth.instance.isSignInWithEmailLink(email)
//         ? _name
//         : FirebaseAuth.instance.currentUser.displayName;
//   }

//   String get surname => _surname;
//   String get email => FirebaseAuth.instance.currentUser.email;
//   String get number => _number;
//   bool get gender => _gender;
//   String get country => _country;
//   String get city => _city;
//   String get address => _address;
//   String get url => _url;

//   Future<void> setName(String name) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _name = name;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'name': name})
//         .then((value) => print("Name is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setSurename(String surname) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _surname = surname;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'surname': surname})
//         .then((value) => print("Surname is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setNumber(String number) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _number = number;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'number': number})
//         .then((value) => print("Number is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setGender(bool value) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _gender = value;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'gender': value})
//         .then((value) => print("Gender is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setCountry(String country) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _country = country;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'country': country})
//         .then((value) => print("Country is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setCity(String city) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _city = city;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'city': city})
//         .then((value) => print("City is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> setAddress(String address) async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     _address = address;
//     notifyListeners();
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     await fb
//         .doc('$userId')
//         .set({'address': address})
//         .then((value) => print("City is set!"))
//         .catchError((error) => print(error));
//   }

//   Future<void> initUser() async {
//     final fb = FirebaseFirestore.instance.collection('users/');
//     var userId = FirebaseAuth.instance.currentUser.uid;
//     var dataFetch = await fb.doc('$userId').get();
//     _name = await dataFetch.data()['name'];
//     _surname = await dataFetch.data()['surname'];
//     _email = await dataFetch.data()['email'];
//     _number = await dataFetch.data()['number'];
//     _gender = await dataFetch.data()['gender'];
//     _country = await dataFetch.data()['country'];
//     _city = await dataFetch.data()['city'];
//     _address = await dataFetch.data()['address'];

//     notifyListeners();
//   }
// }

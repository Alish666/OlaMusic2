import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/instrument.dart';
import 'instrument.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data with ChangeNotifier {
  final firebaseFirestore = FirebaseFirestore.instance.collection('catalog');
  User user = FirebaseAuth.instance.currentUser;
  List<Instrument> _catalog = [];
  Map<String, Instrument> _starred = {};

  Future<void> addToStarred(Instrument instrument) async {
    if (_starred.containsKey(instrument.id)) {
      return;
    } else {
      _starred.putIfAbsent(
        instrument.id,
        () => instrument,
      );
    }
    notifyListeners();
    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');

    await fb
        .doc('$userId')
        .collection('favorites/')
        .doc('$instrumentId')
        .set(
          {'id': instrumentId},
        )
        .then((value) => print("Instrument added!"))
        .catchError((error) => print(error));
  }

  Future<void> deleteFromStarred(Instrument instrument) async {
    _starred.remove(instrument.id);
    notifyListeners();

    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');

    await fb
        .doc('$userId')
        .collection('favorites/')
        .doc('$instrumentId')
        .delete()
        .then((value) => print("Instrumed  deleted!"))
        .catchError((error) => print(error));
  }

  Future<void> initStarred() async {
    var userId = FirebaseAuth.instance.currentUser.uid;
    Map<String, Instrument> jmap = {};
    var catalog = await FirebaseFirestore.instance.collection('catalog').get();

    var dataStarred = await FirebaseFirestore.instance
        .collection('users/')
        .doc('$userId')
        .collection('favorites/')
        .get();

    catalog.docs.forEach((element1) {
      dataStarred.docs.forEach((element2) {
        if (element1.id == element2.id) {
          jmap.putIfAbsent(
            element1.id,
            () => Instrument(
                id: element1.id,
                name: element1.get('name'),
                type: element1.get('type'),
                color: element1.get('color'),
                weight: element1.get('weight'),
                url: element1.get('url'),
                price: element1.get('price'),
                family: element1.get('family'),
                overallQuantity: element1.get('overallQuantity'),
                description: element1.get('description')),
          );
        }
      });
    });

    _starred = jmap;
    notifyListeners();
    print(_catalog.toString());
  }

  Map<String, Instrument> get starred {
    return {..._starred};
  }

  List<Instrument> get catalog {
    return [..._catalog];
  }

  Instrument getById(String id) {
    return _catalog.firstWhere((instrument) => id == instrument.id);
  }

  void clearStarred() {
    _starred = {};
    notifyListeners();
  }
}
// ver 0.65
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DataCard with ChangeNotifier {
  String _holderName;
  String _cardNumber;
  String _cvv;
  String _expiryDate;

  String get holderName {
    return _holderName;
  }

  String get cardNumber {
    return _cardNumber;
  }

  String get cvv {
    return _cvv;
  }

  String get expiryDate {
    return _expiryDate;
  }

  void updateData(
      {@required String holderName1,
      @required String cardNumber1,
      @required String cvv1,
      @required String expiryDate1}) {
    _holderName = holderName1;
    _cardNumber = cardNumber1;
    _cvv = cvv1;
    _expiryDate = expiryDate1;
    notifyListeners();
  }

  Future<void> setCardInfo() async {
    final fb = FirebaseFirestore.instance.collection('cards/');
    var userId = FirebaseAuth.instance.currentUser.uid;

    await fb
        .doc('$userId')
        .set({
          'holderName': _holderName,
          'cardNumber': _cardNumber,
          'cvv': _cvv,
          'expiryDate': _expiryDate
        })
        .then((value) => print("Card Information is set!"))
        .catchError((error) => print(error));

    initCardInfo();
  }

  Future<void> initCardInfo() async {
    final fb = FirebaseFirestore.instance.collection('cards/');
    var userId = FirebaseAuth.instance.currentUser.uid;
    var dataFetch = await fb.doc('$userId').get();

    String holderName1 = await dataFetch.data()['holderName'];
    String cardNumber1 = await dataFetch.data()['cardNumber'];
    String cvv1 = await dataFetch.data()['cvv'];
    String expiryDate1 = await dataFetch.data()['expiryDate'];

    _holderName = holderName1;
    _cardNumber = cardNumber1;
    _cvv = cvv1;
    _expiryDate = expiryDate1;

    notifyListeners();
    print(_cardNumber + ' IS THIS!');
  }

  void clearData() {
    _holderName = null;
    _cardNumber = null;
    _cvv = null;
    _expiryDate = null;
    notifyListeners();
  }
}

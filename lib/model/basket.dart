import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BasketItem {
  int quantity;
  Instrument instrument;

  BasketItem({this.quantity, this.instrument});
}

class Basket with ChangeNotifier {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get controller {
    return _controller;
  }

  Map<String, BasketItem> _basket = {};

  int get basketCount {
    return _basket.length;
  }

  Map<String, BasketItem> get basket {
    return {..._basket};
  }

  Future<void> initBasket() async {
    var userId = FirebaseAuth.instance.currentUser.uid;
    Map<String, BasketItem> tmap = {};
    var catalog = await FirebaseFirestore.instance.collection('catalog').get();

    var dataBasket = await FirebaseFirestore.instance
        .collection('users/')
        .doc('$userId')
        .collection('basket/')
        .get();

    catalog.docs.forEach((element1) {
      dataBasket.docs.forEach((element2) {
        if (element1.id == element2.id) {
          tmap.putIfAbsent(
            element1.id,
            () => BasketItem(
              quantity: element2.get('number'),
              instrument: Instrument(
                id: element1.id,
                name: element1.get('name'),
                type: element1.get('type'),
                typeName: element1.get('typeName'),
                color: element1.get('color'),
                weight: element1.get('weight'),
                url: element1.get('url'),
                price: element1.get('price'),
                family: element1.get('family'),
                overallQuantity: element1.get('overallQuantity'),
                description: element1.get('description'),
              ),
            ),
          );
        }
      });
    });
    _basket = tmap;
    notifyListeners();
  }

  Future<void> addToBasket(Instrument instrument) async {
    if (_basket.containsKey(instrument.id)) {
      _basket.update(
        instrument.id,
        (element) => BasketItem(
            instrument: element.instrument, quantity: element.quantity + 1),
      );
    } else {
      _basket.putIfAbsent(
        instrument.id,
        () => BasketItem(instrument: instrument, quantity: 1),
      );
    }
    notifyListeners();

    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');

    await fb
        .doc('$userId')
        .collection('basket/')
        .doc('$instrumentId')
        .set(
          {'number': 1},
        )
        .then((value) => print("Instrument added!"))
        .catchError((error) => print(error));
  }

  Future<void> deleteFromBasket(Instrument instrument) async {
    _basket.remove(instrument.id);
    notifyListeners();

    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');

    await fb
        .doc('$userId')
        .collection('basket/')
        .doc('$instrumentId')
        .delete()
        .then((value) => print("Instrumed  deleted!"))
        .catchError((error) => print(error));
  }

  Future<void> increment(Instrument instrument) async {
    _basket.update(
      instrument.id,
      (element) => BasketItem(
          instrument: element.instrument, quantity: element.quantity + 1),
    );
    notifyListeners();

    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');

    await fb
        .doc('$userId')
        .collection('basket/')
        .doc('$instrumentId')
        .update({'number': FieldValue.increment(1)})
        .then((value) => print("Instrumed  deleted!"))
        .catchError((error) => print(error));
  }

  Future<void> decrement(Instrument instrument) async {
    var instrumentId = instrument.id;
    var userId = FirebaseAuth.instance.currentUser.uid;
    var fb = FirebaseFirestore.instance.collection('users/');
    if (_basket[instrument.id].quantity >= 2) {
      _basket.update(
        instrument.id,
        (element) => BasketItem(
            instrument: element.instrument, quantity: element.quantity - 1),
      );
      notifyListeners();
      await fb
          .doc('$userId')
          .collection('basket/')
          .doc('$instrumentId')
          .update({'number': FieldValue.increment(-1)})
          .then((value) => print("Instrumed  deleted!"))
          .catchError((error) => print(error));
    } else {
      print("no changes");
    }
  }

  double get totalAmount {
    double total = 0.0;
    _basket.forEach((key, basketItem) {
      total += basketItem.instrument.price * basketItem.quantity;
    });
    return total;
  }

  double get totalProducts {
    double total = 0.0;
    _basket.forEach((key, basketItem) {
      total += basketItem.quantity;
    });
    return total;
  }
}

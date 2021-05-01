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

  void addToBasket(Instrument instrument) {
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
  }

  void increment(Instrument instrument) {
    _basket.update(
      instrument.id,
      (element) => BasketItem(
          instrument: element.instrument, quantity: element.quantity + 1),
    );
    notifyListeners();
  }

  void decrement(Instrument instrument) {
    if (_basket[instrument.id].quantity >= 2) {
      _basket.update(
        instrument.id,
        (element) => BasketItem(
            instrument: element.instrument, quantity: element.quantity - 1),
      );
    } else {
      print("no changes");
    }
    notifyListeners();
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

  void deleteFromBasket(Instrument instrument) {
    _basket.remove(instrument.id);
    notifyListeners();
  }
}

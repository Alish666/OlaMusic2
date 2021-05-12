import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/basket.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:olamusic/screens/NavigationBar.dart';
import 'package:olamusic/widgets/InstrumentDetailsElement.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'CartScreen.dart';

class InstrumentDetailScreen extends StatefulWidget {
  // final String takenId;
  // InstrumentDetailScreen({this.takenId});

  @override
  _InstrumentDetailScreenState createState() => _InstrumentDetailScreenState();
}

class _InstrumentDetailScreenState extends State<InstrumentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final instrument = ModalRoute.of(context).settings.arguments as Instrument;

    final basketData = Provider.of<Basket>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'oLA ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              TextSpan(
                  text: 'Music',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20))
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: InstrumentDetailsElement(instrument: instrument),
      floatingActionButton: AnimatedButton(
        onPressed: () {
          if (basketData.basket.containsKey(instrument.id) &&
              basketData.controller.index == 1) {
            basketData.controller.jumpToTab(4);
          } else if (basketData.basket.containsKey(instrument.id) &&
              basketData.controller.index == 4) {
            Navigator.pop(context);
          } else {
            basketData.addToBasket(instrument);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Instrument is added to basket!',
                      ),
                      TextButton(
                          onPressed: () =>
                              basketData.deleteFromBasket(instrument),
                          child: Text(
                            'UNDO',
                            style: TextStyle(color: Colors.red[600]),
                          ))
                    ],
                  ),
                ),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              basketData.basket.containsKey(instrument.id)
                  ? Icons.arrow_right
                  : Icons.add_shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              basketData.basket.containsKey(instrument.id)
                  ? "GO TO CART"
                  : "ADD TO CART",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        height: 60,
        width: 375,
        color: Colors.green[700],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

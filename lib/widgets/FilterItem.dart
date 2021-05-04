import 'package:flutter/material.dart';
import 'package:olamusic/screens/ProductsOverviewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FilterItem extends StatefulWidget {
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ListView(
        children: <Widget>[
          Container(
            height: 42,
            child: TextFormField(
                controller: name,
                cursorHeight: 0.1,
                cursorColor: Colors.black,
                style: TextStyle(
                  height: 3,
                ),
                validator: (value) {
                  if (value.length < 2) {
                    return 'Enter at least 2 characters';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Model or product name'),
                onEditingComplete: () {
                  if (name.text.isEmpty) {
                    return;
                  } else {
                    _goToProductsOverviewScreen(name.text, context);
                    name.clear();
                  }
                }),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://cdn.webshopapp.com/shops/179375/files/344232878/500x500x1/resonator.jpg',
                    scale: 3.8,
                  ),
                  Text(
                    'STRINGED INSTRUMENTS',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('S', context);
                        print(name);
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://preview.free3d.com/img/2019/05/2158649853872178869/ukustdej-900.jpg',
                    scale: 6.8,
                  ),
                  Text(
                    'WIND INSTRUMENTS',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('W', context);
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://static7.depositphotos.com/1000165/732/i/950/depositphotos_7320620-stock-photo-percussion-instruments.jpg',
                    scale: 7.9,
                  ),
                  Text(
                    'PERCUSSION INSTRUMENTS',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('P', context);
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://www.korgmusic.ru/upload/iblock/d2d/4.png',
                    scale: 3.8,
                  ),
                  Text(
                    'KEYBOARD INSTRUMENTS',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('K', context);
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://aliradar.com/api/image?url=https%3A%2F%2Fae01.alicdn.com%2Fkf%2FHTB1leciXKH2gK0jSZJnq6yT1FXaA%2FBig-Power-Bluetooth-Speaker-Wireless-Stereo-Music-Player-Audio-equipment-Support-FM-Radio-TF-Singing-Speech.jpg_640x640.jpg',
                    scale: 4.8,
                  ),
                  Text(
                    'AUDIO EQUIPMENTS',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('E', context);
                      })
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOxpVcp910Sj7pR7J5kwnCPs-wJng0YEDbLA&usqp=CAU',
                    scale: 1.7,
                  ),
                  Text(
                    'ACCESSORIES',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        _goToProductsOverviewScreen('A', context);
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToProductsOverviewScreen(String family, BuildContext context) {
    pushNewScreenWithRouteSettings(context,
        screen: ProductsOverviewScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
        settings:
            RouteSettings(name: '/InstrumentDetailScreen', arguments: family));
  }
}

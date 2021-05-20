import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/basket.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share/share.dart';

class CartScreenItem extends StatefulWidget {
  @override
  _CartScreenItemState createState() => _CartScreenItemState();
}

class _CartScreenItemState extends State<CartScreenItem> {
  @override
  Widget build(BuildContext context) {
    final basketData = Provider.of<Basket>(context);
    return basketData.basket.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "No Orders yet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  LineIcons.frowningFace,
                  size: 70,
                )
              ],
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: basketData.basketCount,
            itemBuilder: (BuildContext context, int index) {
              String key = basketData.basket.keys.elementAt(index);
              return Slidable(
                actionExtentRatio: 0.25,
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () =>
                        _share(context, basketData.basket[key].instrument),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => basketData
                        .deleteFromBasket(basketData.basket[key].instrument),
                  ),
                ],
                actionPane: SlidableDrawerActionPane(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => goToInstrumentDetailScreen(
                          context, basketData.basket[key].instrument),
                      child: Card(
                        borderOnForeground: true,
                        elevation: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  primaryColor:
                                      Color.fromRGBO(83, 83, 83, 0.5)),
                              child: OctoImage(
                                image: NetworkImage(
                                  basketData.basket[key].instrument.url,
                                ),
                                width: 100,
                                height: 100,
                                placeholderBuilder: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => goToInstrumentDetailScreen(
                                context, basketData.basket[key].instrument),
                            child: Text(
                              basketData.basket[key].instrument.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            '\$' +
                                (basketData.basket[key].instrument.price *
                                        basketData.basket[key].quantity)
                                    .toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            basketData.basket[key].instrument.typeName,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: () => basketData
                              .increment(basketData.basket[key].instrument),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          basketData.basket[key].quantity.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          onPressed: () => basketData
                              .decrement(basketData.basket[key].instrument),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
  }

  void goToInstrumentDetailScreen(BuildContext context, Instrument instrument) {
    pushNewScreenWithRouteSettings(context,
        screen: InstrumentDetailScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
        settings: RouteSettings(
            name: '/InstrumentDetailScreen', arguments: instrument));
  }

  void _share(BuildContext context, Instrument instrument) async {
    final String subject = 'Get ${instrument.typeName} in Ola Music!';
    final String body =
        'Get ${instrument.typeName} in our website! \n ${instrument.name} - \n${instrument.price} US Dollars';
    await Share.share(body, subject: subject);
  }
}
//basketData.basket[key].instrument.name
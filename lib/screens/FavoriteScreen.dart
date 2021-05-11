import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:like_button/like_button.dart';
import 'package:share/share.dart';
import 'InstrumentDetailScreen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        title: Center(
          child: RichText(
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
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Liked",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                Container(
                  child: Text(
                    data.starredCount.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(9)),
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.starred.length,
              itemBuilder: (ctx, i) {
                String key = data.starred.keys.elementAt(i);
                return Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Slidable(
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () => _share(context, data.starred[key]),
                      ),
                    ],
                    actionPane: SlidableDrawerActionPane(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => goToInstrumentDetailScreen(
                              context, data.starred[key]),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: -2.8,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: OctoImage(
                                height: 80,
                                width: 80,
                                image: NetworkImage(data.starred[key].url),
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
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => goToInstrumentDetailScreen(
                                    context, data.starred[key]),
                                child: Text(
                                  data.starred[key].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                '\$' + (data.starred[key].price).toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        LikeButton(
                          onTap: (_) =>
                              data.deleteFromStarred(data.starred[key]),
                          likeBuilder: (_) => Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  screenRefresh(BuildContext context) {
    Provider.of<Data>(context).initStarred();
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

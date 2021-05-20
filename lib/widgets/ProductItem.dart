import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import '../model/instrument.dart';
import '../model/data.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final instrument = Provider.of<Instrument>(context, listen: true);
    final data = Provider.of<Data>(context);
    return GestureDetector(
      onTap: () => pushNewScreenWithRouteSettings(
        context,
        screen: InstrumentDetailScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
        settings: RouteSettings(
            name: '/InstrumentDetailScreen', arguments: instrument),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                spreadRadius: -4,
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              )
            ]),
        child: GridTile(
          header: GridTileBar(
            title: Text('         '),
            trailing: IconButton(
              alignment: Alignment.topLeft,
              icon: data.starred.containsKey(instrument.id)
                  ? Icon(
                      Icons.favorite,
                      size: 28,
                      color: Colors.red[600],
                    )
                  : Icon(
                      Icons.favorite,
                      size: 28,
                      color: Colors.grey,
                    ),
              onPressed: () {
                if (data.starred.containsKey(instrument.id)) {
                  data.deleteFromStarred(instrument);
                } else {
                  data.addToStarred(instrument);
                }
              },
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              OctoImage(
                width: 130,
                height: 130,
                placeholderBuilder: (context) => Container(
                  height: 50,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  ),
                ),
                image: NetworkImage(
                  instrument.url,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$" + instrument.price.toString(),
                      style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      instrument.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToIstrumentDetailScreen(BuildContext context, String id) {
    Navigator.pushNamed(context, '/InstrumentDetailScreen', arguments: id);
  }
}

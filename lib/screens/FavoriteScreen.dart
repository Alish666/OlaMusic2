import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import 'InstrumentDetailScreen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return RefreshIndicator(
      onRefresh: () => screenRefresh(context),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(249, 247, 243, 1),
          title: Center(
            child: Text(
              "oLA",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: data.starred.length,
          itemBuilder: (ctx, i) {
            String key = data.starred.keys.elementAt(i);
            return ListTile(
              onTap: () => pushNewScreenWithRouteSettings(
                context,
                screen: InstrumentDetailScreen(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                settings: RouteSettings(
                    name: '/InstrumentDetailScreen',
                    arguments: data.starred[key]),
              ),
              leading: CircleAvatar(
                child: Text(data.starred[key].id),
              ),
              title: Text(data.starred[key].name),
              trailing: IconButton(
                icon: Icon(
                  Icons.star,
                  size: 28,
                  color: Colors.yellow[600],
                ),
                onPressed: () {
                  data.deleteFromStarred(data.starred[key]);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  screenRefresh(BuildContext context) {
    Provider.of<Data>(context).initStarred();
  }
}

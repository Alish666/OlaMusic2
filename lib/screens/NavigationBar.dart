import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/basket.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/screens/CartScreen.dart';
import 'package:olamusic/screens/HomePageScreen.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import 'package:olamusic/screens/ProductsOverviewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'FavoriteScreen.dart';
import 'ProfileScreen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Widget> _buildScreens() {
    return [
      HomePageScreen(),
      ProductsOverviewScreen(),
      FavoriteScreen(),
      ProfileScreen(),
      CartScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 15),
        iconSize: 27,
        activeColorSecondary: Colors.white,
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Color.fromRGBO(255, 188, 44, 1),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 15),
        iconSize: 27,
        activeColorSecondary: Colors.white,
        icon: Icon(Icons.chrome_reader_mode_outlined),
        title: ("Catalog"),
        activeColorPrimary: Color.fromRGBO(255, 188, 44, 1),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 15),
        iconSize: 27,
        activeColorSecondary: Colors.white,
        icon: Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: Color.fromRGBO(255, 188, 44, 1),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 15),
        iconSize: 27,
        activeColorSecondary: Colors.white,
        icon: Icon(Icons.account_circle),
        title: ("Profile"),
        activeColorPrimary: Color.fromRGBO(255, 188, 44, 1),
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        textStyle: TextStyle(fontSize: 15),
        iconSize: 27,
        activeColorSecondary: Colors.white,
        inactiveIcon: Badge(
          animationType: BadgeAnimationType.fade,
          child: Icon(Icons.shopping_cart),
          badgeContent: Text(
            Provider.of<Basket>(context).basketCount.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        icon: Icon(Icons.shopping_cart),
        title: ("Card"),
        activeColorPrimary: Color.fromRGBO(255, 188, 44, 1),
        inactiveColorPrimary: Colors.white,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Data>(context, listen: true).initStarred();
    Provider.of<Basket>(context, listen: true).initBasket();
    PersistentTabController _controller =
        Provider.of<Basket>(context).controller;
    return PersistentTabView(
      context,
      navBarHeight: 65,
      stateManagement: true,
      backgroundColor: Colors.black,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}

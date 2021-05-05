import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/screens/AuthScreen.dart';

import 'package:olamusic/screens/HomePageScreen.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import 'package:olamusic/screens/ProductsOverviewScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'model/basket.dart';
import 'screens/CartScreen.dart';
import 'screens/FavoriteScreen.dart';
import 'screens/NavigationBar.dart';
import 'screens/ProfileScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/ProfileScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User user;

  @override
  void initState() {
    _auth.userChanges().listen((event) => setState(() => user = event));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Data()),
        ChangeNotifierProvider(create: (ctx) => Basket()),
        ChangeNotifierProvider(create: (ctx) => OlaUser()),
      ],
      child: MaterialApp(
        home: user != null ? NavigationBar() : AuthScreen(),
        routes: {
          '/HomePageScreen': (context) => HomePageScreen(),
          '/InstrumentDetailScreen': (context) => InstrumentDetailScreen(),
          '/ProductsOverviewScreen': (context) => ProductsOverviewScreen(),
          '/FavoriteScreen': (context) => FavoriteScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
          '/CartScreen': (context) => CartScreen(),
          '/NavigationBar': (context) => NavigationBar(),
          '/AuthScreen': (context) => AuthScreen()
        },
      ),
    );
  }
}

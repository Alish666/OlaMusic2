import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/widgets/CatalogViewBuilder.dart';
import 'package:olamusic/widgets/ProductItem.dart';
import 'package:provider/provider.dart';
import '../model/instrument.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        title: Center(
          child: Text(
            "Products",
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
        elevation: 0,
      ),
      body: CatalogViewBuilder(),
    );
  }
}


// var _isInit = true; // CHANGE THE VARIABLE
//   var _isLoading = false; // CHANGE THE VARIABLE

//   @override
//   void didChangeDependencies() {
//     // CHANGE THE METHOD
//     if (_isInit) {
//       setState(() {
//         _isLoading = true;
//       });
//       Provider.of<Data>(context).dataSetFromServer().then((_) {
//         setState(() {
//           _isLoading = false;
//         });
//       });
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }
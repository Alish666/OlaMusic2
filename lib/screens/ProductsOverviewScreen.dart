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

enum FilterOptions {
  Ascending,
  Descending,
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final family = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 243, 1),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Color.fromRGBO(249, 247, 243, 1),
        title: Text(
          "Products",
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: CatalogViewBuilder(family: family),
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
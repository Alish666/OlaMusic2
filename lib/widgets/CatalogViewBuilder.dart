import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:provider/provider.dart';
import 'ProductItem.dart';

class CatalogViewBuilder extends StatefulWidget {
  final String family;

  CatalogViewBuilder({Key key, this.family}) : super(key: key);

  @override
  _CatalogViewBuilderState createState() => _CatalogViewBuilderState();
}

class _CatalogViewBuilderState extends State<CatalogViewBuilder> {
  @override
  Widget build(BuildContext context) {
    var catalogData = widget.family.length > 1
        ? FirebaseFirestore.instance
            .collection('catalog')
            .where('indexSearch', arrayContains: widget.family.toLowerCase())
            .snapshots()
        : FirebaseFirestore.instance
            .collection('catalog')
            .where('family', isEqualTo: widget.family)
            .snapshots();

    final data = Provider.of<Data>(context);
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (ctx, i) {
              return ChangeNotifierProvider.value(
                value: Instrument(
                  description: snapshot.data.docs[i]['description'],
                  color: snapshot.data.docs[i]['color'],
                  family: snapshot.data.docs[i]['family'],
                  id: snapshot.data.docs[i]['id'],
                  name: snapshot.data.docs[i]['name'],
                  overallQuantity: snapshot.data.docs[i]['overallQuantity'],
                  price: snapshot.data.docs[i]['price'],
                  type: snapshot.data.docs[i]['type'],
                  typeName: snapshot.data.docs[i]['typeName'],
                  url: snapshot.data.docs[i]['url'],
                  weight: snapshot.data.docs[i]['weight'],
                ),
                child: ProductItem(),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
      stream: catalogData,
    );
  }

  screenRefresh(BuildContext context) {
    Provider.of<Data>(context, listen: false).initStarred();
  }
}

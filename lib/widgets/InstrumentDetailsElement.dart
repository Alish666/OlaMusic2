import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math';

import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'Popular.dart';

class InstrumentDetailsElement extends StatefulWidget {
  final Instrument instrument;
  InstrumentDetailsElement({this.instrument});

  @override
  _InstrumentDetailsElementState createState() =>
      _InstrumentDetailsElementState();
}

class _InstrumentDetailsElementState extends State<InstrumentDetailsElement> {
  Random random;
  var n;
  @override
  void initState() {
    random = new Random();
    n = random.nextInt(3) + 2;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context);
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        Stack(
          children: [
            OctoImage(
                image: NetworkImage(widget.instrument.url),
                fit: BoxFit.contain,
                placeholderBuilder: (context) => Container(
                      height: 250,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    )),
            Positioned(
              bottom: 25,
              right: 25,
              child: Container(
                child: Text(
                  widget.instrument.overallQuantity.toString(),
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
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 14,
              ),
              Text(
                widget.instrument.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + widget.instrument.price.toString(),
                    style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        glowColor: Color.fromRGBO(255, 206, 100, 1),
                        initialRating: n.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 188, 44, 1),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            n = rating.toInt();
                          });
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${n.toString()}/5',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.instrument.typeName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: data.starred.containsKey(widget.instrument.id)
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
                          if (data.starred.containsKey(widget.instrument.id)) {
                            data.deleteFromStarred(widget.instrument);
                          } else {
                            data.addToStarred(widget.instrument);
                          }
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.indigoAccent,
                            size: 28,
                          ),
                          onPressed: () => _share(context, widget.instrument))
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'About',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                widget.instrument.description,
                style: TextStyle(color: Colors.grey[900], fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Delivery of this instrument in Central Asia \ncountries: 9 days, 0 - 20\$.',
                style: TextStyle(color: Colors.grey[800], fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 1.5,
              ),
              Text(
                'Vendor code',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                widget.instrument.id.toUpperCase(),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                'Color',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                widget.instrument.color.toLowerCase(),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                'Weight',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                widget.instrument.weight.toString(),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Popular",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              SizedBox(
                height: 15,
              ),
              Popular(),
              SizedBox(
                height: 78,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _share(BuildContext context, Instrument instrument) async {
    final String subject = 'Get ${instrument.typeName} in Ola Music!';
    final String body =
        'Get ${instrument.typeName} in our website! \n ${instrument.name} - \n${instrument.price} US Dollars';
    await Share.share(body, subject: subject);
  }
}

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/basket.dart';

class OrderItem extends StatefulWidget {
  final Map<String, BasketItem> items;
  OrderItem({@required this.items});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(249, 247, 243, 1),
          boxShadow: [
            BoxShadow(
              spreadRadius: -2.8,
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 3,
            )
          ]),
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: ExpansionCard(
          onExpansionChanged: (value) {
            setState(() {
              expanded = value;
            });
          },
          trailing: Icon(
            expanded ? LineIcons.angleUp : LineIcons.angleDown,
            color: Colors.black,
            size: 15,
          ),
          margin: EdgeInsets.only(top: 1),
          title: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                'x' + _totalProducts().toInt().toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              '\$' + _totalAmount().toString(),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          children: [
            ListView.builder(
              itemCount: widget.items.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                String key = widget.items.keys.elementAt(i);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(
                      'x' + widget.items[key].quantity.toString(),
                    ),
                  ),
                  title: Text(widget.items[key].instrument.name),
                  trailing: Text(
                    '\$' + widget.items[key].instrument.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  double _totalAmount() {
    double total = 0.0;
    widget.items.forEach((key, basketItem) {
      total += basketItem.instrument.price * basketItem.quantity;
    });
    return total;
  }

  double _totalProducts() {
    double total = 0.0;
    widget.items.forEach((key, basketItem) {
      total += basketItem.quantity;
    });
    return total;
  }
}

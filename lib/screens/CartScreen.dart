import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/basket.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/widgets/CartScreenItem.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final basketData = Provider.of<Basket>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36),
                  ),
                  Container(
                    child: Text(
                      basketData.basketCount.toString(),
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
              Card(
                color: Colors.black,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        "\$" + basketData.totalAmount.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CartScreenItem(),
              SizedBox(
                height: 7,
              ),
              Divider(
                color: Colors.black,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Promocode!',
                ),
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.text,
                scrollPadding: EdgeInsets.all(20),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Text>[
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$' + basketData.totalAmount.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Text>[
                  Text(
                    "Sale From shop",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    '-12%',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Text>[
                  Text(
                    "Items",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    basketData.totalProducts.toInt().toString(),
                    style: TextStyle(fontSize: 17),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: AnimatedButton(
        onPressed: () {},
        child: Text(
          "CHECKOUT",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        height: 60,
        width: 375,
        color: Colors.green[700],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

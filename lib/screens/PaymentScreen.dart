import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/basket.dart';
import 'package:olamusic/model/card.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/widgets/OrderItem.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _formKey = GlobalKey<FormState>();
  var _formKey2 = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController countryController;

  @override
  void initState() {
    emailController = TextEditingController(
        text: Provider.of<OlaUser>(context, listen: false).email);
    countryController = TextEditingController(
        text: Provider.of<OlaUser>(context, listen: false).countryText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final basketData = Provider.of<Basket>(context);
    final dataCard = Provider.of<DataCard>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(255, 188, 44, 1),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'oLA ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              TextSpan(
                  text: 'Music',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20))
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              OrderItem(
                items: basketData.basket,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Products Total',
                style: TextStyle(color: Colors.grey[600], fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$' + basketData.totalAmount.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '     Card Information',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  CreditCardForm(
                    cardNumber: dataCard.cardNumber,
                    expiryDate: dataCard.expiryDate,
                    cardHolderName: dataCard.holderName,
                    cvvCode: dataCard.cvv,
                    themeColor: Colors.black,
                    formKey: _formKey,
                    cardNumberDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(249, 247, 243, 1),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(LineIcons.creditCard),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(249, 247, 243, 1),
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      suffixIcon: Icon(LineIcons.key),
                      filled: true,
                      fillColor: Color.fromRGBO(249, 247, 243, 1),
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(249, 247, 243, 1),
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    onCreditCardModelChange:
                        (CreditCardModel creditCardModel) {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Information',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.black,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 2) {
                                  return 'Enter at least 2 chars!';
                                } else if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'Enter email!';
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(LineIcons.envelope),
                                filled: true,
                                fillColor: Color.fromRGBO(249, 247, 243, 1),
                                border: OutlineInputBorder(),
                                labelText: 'Email Address',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              primaryColor: Colors.black,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 2) {
                                  return 'Enter at least 2 chars!';
                                } else if (value == null || value.isEmpty) {
                                  return 'Enter Country!';
                                } else {
                                  return null;
                                }
                              },
                              controller: countryController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(LineIcons.flag),
                                filled: true,
                                fillColor: Color.fromRGBO(249, 247, 243, 1),
                                border: OutlineInputBorder(),
                                labelText: 'Country',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AnimatedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate() &&
                                  _formKey2.currentState.validate()) {
                                _await(context: context, basketData: basketData)
                                    .then(
                                        (value) => Navigator.of(context).pop())
                                    .then((value) => _showResult(
                                        context: context,
                                        message:
                                            'Products purchased successfully!',
                                        icon: LineIcons.checkCircle,
                                        color: Colors.green));
                              }
                            },
                            child: Text(
                              "Pay" +
                                  '  \$' +
                                  basketData.totalAmount.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            height: 60,
                            width: 355,
                            color: Color.fromRGBO(255, 188, 44, 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Powered by ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                            fontSize: 14)),
                    TextSpan(
                      text: 'Ola Music',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _await(
      {@required BuildContext context, @required Basket basketData}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        basketData.clearData();
        Future.delayed(Duration(seconds: 4), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          backgroundColor: Colors.black,
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please wait...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showResult(
      {@required BuildContext context,
      @required String message,
      @required IconData icon,
      @required Color color}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.yellow[900])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

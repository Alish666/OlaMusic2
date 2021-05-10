import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:olamusic/model/card.dart';
import 'package:olamusic/model/user.dart';
import 'package:provider/provider.dart';

class FormCardPayment extends StatefulWidget {
  @override
  _FormCardPaymentState createState() => _FormCardPaymentState();
}

class _FormCardPaymentState extends State<FormCardPayment> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBackShown = false;
  @override
  Widget build(BuildContext context) {
    final dataCard = Provider.of<DataCard>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CreditCardWidget(
            cardNumber: dataCard.cardNumber == null ? '' : dataCard.cardNumber,
            expiryDate: dataCard.expiryDate == null ? '' : dataCard.expiryDate,
            cardHolderName:
                dataCard.holderName == null ? '' : dataCard.holderName,
            cvvCode: dataCard.cvv == null ? '' : dataCard.cvv,
            showBackView: isBackShown,
            cardBgColor: Colors.grey[900],
            obscureCardCvv: false,
            obscureCardNumber: true,
          ),
          SizedBox(
            height: 20,
          ),
          CreditCardForm(
            cardNumber: dataCard.cardNumber,
            expiryDate: dataCard.expiryDate,
            cardHolderName: dataCard.holderName,
            cvvCode: dataCard.cvv,
            onCreditCardModelChange: (CreditCardModel creditCardModel) {
              dataCard.updateData(
                  holderName1: creditCardModel.cardHolderName,
                  cardNumber1: creditCardModel.cardNumber,
                  cvv1: creditCardModel.cvvCode,
                  expiryDate1: creditCardModel.expiryDate);
              setState(() {
                isBackShown = !isBackShown;
              });
            },
            themeColor: Colors.black,
            formKey: formKey,
            cardNumberDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Card Holder',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedButton(
            color: Color.fromRGBO(255, 188, 44, 1),
            onPressed: () {
              if (formKey.currentState.validate()) {
                print('Valid!');
                dataCard.setCardInfo();
              } else {
                print('Invalid!');
              }
            },
            child: Text(
              'VALIDATE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

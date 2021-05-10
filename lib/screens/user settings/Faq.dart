import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Q/A',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            _form(
                question: 'What is application about?',
                answer:
                    'Application is about online shop for getting musical instruments and so on!')
          ],
        ),
      ),
    );
  }

  Widget _form({@required String question, @required String answer}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(25, 25, 25, 1)),
      child: ExpansionCard(
        margin: EdgeInsets.only(top: 1),
        title: ListTile(
          leading: Icon(
            LineIcons.questionCircle,
            size: 30,
            color: Colors.yellow[600],
          ),
          title: Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 15),
            child: Text(
              answer,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

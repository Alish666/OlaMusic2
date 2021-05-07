import 'package:flutter/material.dart';

class Recomendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Card(
              borderOnForeground: true,
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.network(
                  'https://i.imgur.com/10vxfKm.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 38,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {},
                  child: Text(
                    'Marshall Origin 50C',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                RichText(
                  text: new TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                          text: '\$809.0   ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[400])),
                      new TextSpan(
                          text: '\$950.0',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Amplifier',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

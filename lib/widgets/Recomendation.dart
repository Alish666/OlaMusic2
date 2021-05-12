import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Recomendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToInstrumentDetailScreen(
        context,
        Instrument(
            id: '8g1tg1Ky8ma5IymEimxX',
            name: 'Marshall Origin 50C',
            type: 'amp',
            typeName: 'Amplifier',
            color: 'Black',
            weight: 18,
            url: 'https://i.imgur.com/10vxfKm.png',
            price: 809,
            family: 'E',
            overallQuantity: 40,
            description:
                'Tube combo amplifier, power 50 watts, power reduction technology: average power about 10 W and low power about 5 W; 12-inch speaker Celestion G12N-60 Midnight 60 (16Ω, 60W), effects loop: series, send / return; body in classic vintage Marshall style, equipped with 3 x ECC83 and 2 x EL34 lamps.'),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: OctoImage(
                  image: NetworkImage(
                    'https://i.imgur.com/10vxfKm.png',
                  ),
                  placeholderBuilder:
                      OctoPlaceholder.blurHash('LcLg%~of?bf6xuj[WBjt~qayIUj['),
                  height: 130,
                  width: 130,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Marshall Origin 50C',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
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
                    height: 5,
                  ),
                  Text(
                    'Amplifier',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              IconButton(
                  icon: Icon(
                    LineIcons.angleRight,
                    color: Colors.white,
                  ),
                  onPressed: () => _goToInstrumentDetailScreen(
                        context,
                        Instrument(
                            id: '8g1tg1Ky8ma5IymEimxX',
                            name: 'Marshall Origin 50C',
                            type: 'amp',
                            typeName: 'Amplifier',
                            color: 'Black',
                            weight: 18,
                            url: 'https://i.imgur.com/10vxfKm.png',
                            price: 809,
                            family: 'E',
                            overallQuantity: 40,
                            description:
                                'Tube combo amplifier, power 50 watts, power reduction technology: average power about 10 W and low power about 5 W; 12-inch speaker Celestion G12N-60 Midnight 60 (16Ω, 60W), effects loop: series, send / return; body in classic vintage Marshall style, equipped with 3 x ECC83 and 2 x EL34 lamps.'),
                      ))
            ],
          ),
        ),
      ),
    );
  }

  void _goToInstrumentDetailScreen(
      BuildContext context, Instrument instrument) {
    pushNewScreenWithRouteSettings(context,
        screen: InstrumentDetailScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
        settings: RouteSettings(
            name: '/InstrumentDetailScreen', arguments: instrument));
  }
}

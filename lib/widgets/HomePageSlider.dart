import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:octo_image/octo_image.dart';

class HomePageSlider extends StatefulWidget {
  @override
  _HomePageSliderState createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [_firstPage(), _secondPage(), _thirdScreen()];
    return Theme(
      data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(255, 188, 44, 1),
          disabledColor: Colors.black),
      child: Swiper(
        viewportFraction: 0.9,
        itemCount: 3,
        autoplay: true,
        autoplayDelay: 7000,
        itemHeight: 330,
        itemWidth: double.maxFinite,
        layout: SwiperLayout.STACK,
        itemBuilder: (ctx, i) => _list[i],
        pagination: SwiperPagination(margin: EdgeInsets.only(top: 20)),
      ),
    );
  }

  Widget _firstPage() {
    ////////////////////////////////////////////////////// BBEEEEEEEEEEGIIIIIIIIIIIIIIIIIIIIIINNNNNNNNNNSSSSSSSSSSSS
    return Card(
      margin: EdgeInsets.only(bottom: 15, top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () {},
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    child: Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 70.0,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            ScaleAnimatedText('Get Your'),
                            ScaleAnimatedText('50% Sale'),
                            ScaleAnimatedText('Right Now'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                    height: 250,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromRGBO(117, 55, 209, 1),
                      Color.fromRGBO(160, 98, 253, 1)
                    ])),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: 300,
                    child: Text(
                      'Get 50% sales till August!',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 25),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Hurry up to get all from summer  ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Ola Music Exclusive',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ); ////////////////////////////////////////////////////// EEEEEEEEEEEEEEENNNNNNNNNNNNNNNNNDDDDDDDDDDDDDDDDDDDDDDDDDDDSSSSSSSSSS
  }

  Widget _secondPage() {
    return Card(
      margin: EdgeInsets.only(bottom: 15, top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () {},
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: OctoImage(
                    image: NetworkImage(
                        'https://i.ibb.co/K7wSF6Z/The-Piano-Store03-1800x1200.png'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'L7Dll[-;0L-o9}~A~UWX=_%Lx^-:',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: 300,
                    child: Text(
                      'F. Shopen pianos feedback',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 25),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Classical pianos written in history  ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Ola Music Exclusive',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ); ////////////////////////////////////////////////////// EEEEEEEEEEEEEEENNNNNNNNNNNNNNNNNDDDDDDDDDDDDDDDDDDDDDDDDDDDSSSSSSSSSS
  }

  Widget _thirdScreen() {
    return Card(
      margin: EdgeInsets.only(bottom: 15, top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () {},
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: OctoImage(
                    image: NetworkImage(
                        'https://thumbs-prod.si-cdn.com/l7ZmifA3_098mcefNSIEMytGVis=/800x600/filters:no_upscale()/https://public-media.si-cdn.com/filer/3e/6e/3e6ec3a5-9ccb-422a-812c-30443331bf6e/zxy921303web.jpg'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'L49ixdrw005i0wIo}]%30MXR=y=J',
                    ),
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                    height: 250,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    width: 300,
                    child: Text(
                      'Eddie Van Hallens Guitar',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontSize: 25),
                    ),
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Look for Eddie Van Hallens floyd rose guitars  ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Ola Music Exclusive',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _formStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          spreadRadius: -2.8,
          color: Colors.black,
          offset: Offset(2, 2),
          blurRadius: 3,
        )
      ],
    );
  }
}

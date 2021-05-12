import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/screens/ProductsOverviewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePageSlider extends StatefulWidget {
  @override
  _HomePageSliderState createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  List<Widget> _list;
  @override
  void initState() {
    // TODO: implement initState
    _list = [
      _firstPage(context, 'kit'),
      _form(
          url: 'https://i.ibb.co/K7wSF6Z/The-Piano-Store03-1800x1200.png',
          blur: 'L7Dll[-;0L-o9}~A~UWX=_%Lx^-:',
          text: 'Get F.Shopen type pianos now!',
          keyword: 'piano'),
      _form(
          url:
              'https://thumbs-prod.si-cdn.com/l7ZmifA3_098mcefNSIEMytGVis=/800x600/filters:no_upscale()/https://public-media.si-cdn.com/filer/3e/6e/3e6ec3a5-9ccb-422a-812c-30443331bf6e/zxy921303web.jpg',
          blur: 'L49ixdrw005i0wIo}]%30MXR=y=J',
          text: 'Look at Van Halens Floyd Rose guitars',
          keyword: 'stratocaster'),
      _form(
          url:
              'https://img4.goodfon.com/wallpaper/nbig/1/aa/ukulele-gitara-fon.jpg',
          blur: 'LFELmK~pSyIArrI:-o-V9G0LIV%1',
          text: 'Get Ukuleles for Summer!',
          keyword: 'ukulele'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return _list[index];
      },
      itemCount: _list.length,
      options: CarouselOptions(
          autoPlay: true, aspectRatio: 16 / 9, enlargeCenterPage: true),
    );
  }

  Widget _firstPage(BuildContext context, String family) {
    return GestureDetector(
      onTap: () => _goToProductsOverviewScreen(family, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Container(
            child: Center(
              child: DefaultTextStyle(
                style: GoogleFonts.novaFlat(fontSize: 60),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ScaleAnimatedText('Get Your'),
                    ScaleAnimatedText('50% Sale'),
                    ScaleAnimatedText('Right Now'),
                  ],
                  onTap: () => _goToProductsOverviewScreen(family, context),
                ),
              ),
            ),
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(117, 55, 209, 1),
                  Color.fromRGBO(160, 98, 253, 1)
                ],
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
            title: Text(
              'Hurry up to get all till July!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _form(
      {@required String url,
      @required String blur,
      @required String text,
      @required String keyword}) {
    return GestureDetector(
      onTap: () => _goToProductsOverviewScreen(keyword, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black),
          child: GridTile(
            child: OctoImage(
              image: NetworkImage(url),
              width: 300,
              height: 150,
              placeholderBuilder: OctoPlaceholder.blurHash(
                blur,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
              title: Text(
                text,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
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

  void _goToProductsOverviewScreen(String family, BuildContext context) {
    pushNewScreenWithRouteSettings(context,
        screen: ProductsOverviewScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
        settings:
            RouteSettings(name: '/InstrumentDetailScreen', arguments: family));
  }
}

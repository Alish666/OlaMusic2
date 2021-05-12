import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/model/instrument.dart';
import 'package:olamusic/screens/InstrumentDetailScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _PopularItem(
              name: 'Walden D550',
              url: 'https://i.imgur.com/BU8hjHN.png',
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of',
              context: context,
              instrument: Instrument(
                  id: 'HSxMgSQgMO0YIWVwW3jh',
                  name: 'Walden d550e',
                  type: 'guitar',
                  typeName: 'Electro Acoustic Guitar',
                  color: 'Beige',
                  weight: 7,
                  url: 'https://i.imgur.com/BU8hjHN.png',
                  price: 417,
                  family: 'S',
                  overallQuantity: 14,
                  description:
                      'Walden guitars were designed and engineered by California-based guitar designer Jon Lee (who has partnered with the Martin brand) and are marketed in the American music market as "high-end, low-cost instruments." Acoustic guitar, Dreadnought body, solid spruce top, mahogany back and sides, rosewood fingerboard and bridge, fiberglass reinforced mahogany neck, 43mm GraphTech® NuBone nut, Walden MG-20 electronics Active Electronics + tuner, includes Walden Gig Bag, natural color.')),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Effets pedal mooer mod factory mk2',
              url: 'https://i.imgur.com/76YqAK7.png',
              blurhash: 'L6BX9~%d008}.6fkD*jG02ae_Loy',
              context: context,
              instrument: Instrument(
                  id: 'seC3j0hM6JyvEpCZGiuS',
                  name: 'Effets pedal mooer mod factory mk2',
                  type: 'pedal',
                  typeName: 'Effects Pedal',
                  color: 'Green',
                  weight: 2,
                  url: 'https://i.imgur.com/76YqAK7.png',
                  price: 89,
                  family: 'E',
                  overallQuantity: 5,
                  description:
                      'Effects pedal, 11 updated modulation effects in one compact body, high quality 32bit DSP processor, control: Mode, Speed, Depth, Ctrl; Tap Tempo and Acceleration functions, SERIES / PARALLEL modes of operation')),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Gewa VGS',
              url: 'https://i.imgur.com/vkVdilD.png',
              blurhash: 'LVOpc4of?^WB.8jZMxkCozkCRjV@',
              context: context,
              instrument: Instrument(
                  id: 'uN5FmBE97tBpVKuvSBwr',
                  name: 'Gewa vgs manoa p-co',
                  type: 'ukulele',
                  typeName: 'Concert Ukulele',
                  color: 'Dark beige',
                  weight: 1,
                  url: 'https://i.imgur.com/vkVdilD.png',
                  price: 52,
                  family: 'S',
                  overallQuantity: 32,
                  description:
                      'Concert type ukulele, 380 mm scale, 35 mm nut, sapele body and neck, Richlite neck and bridge, matte finish with open pores, Gig-Bag included.')),
        ],
      ),
    );
  }

  Widget _PopularItem(
      {@required String name,
      @required String url,
      @required String blurhash,
      @required BuildContext context,
      @required Instrument instrument}) {
    return GestureDetector(
      onTap: () => _goToInstrumentDetailScreen(context, instrument),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: -4,
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 3,
              )
            ],
          ),
          child: GridTile(
            header: GridTileBar(
              trailing: Icon(
                Icons.thumb_up,
                size: 20,
                color: Color.fromRGBO(255, 188, 44, 1),
              ),
              title: Text(
                name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            child: OctoImage(
              image: NetworkImage(url),
              placeholderBuilder: OctoPlaceholder.blurHash(
                blurhash,
              ),
              fit: BoxFit.fitWidth,
              width: 150,
              height: 150,
            ),
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

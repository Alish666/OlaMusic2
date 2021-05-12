import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:olamusic/screens/ProductsOverviewScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:line_icons/line_icons.dart';

class FilterItem extends StatefulWidget {
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 7,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.white,
            ),
            child: TextFormField(
                autofocus: false,
                controller: name,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value.length < 2) {
                    return 'Enter at least 2 characters';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        LineIcons.chevronCircleRight,
                        size: 30,
                        color: Color.fromRGBO(255, 188, 44, 1),
                      ),
                      onPressed: () {
                        if (name.text.isEmpty) {
                          return;
                        } else {
                          _goToProductsOverviewScreen(name.text, context);
                          name.clear();
                        }
                      },
                    ),
                    hintStyle: TextStyle(
                        color: Colors.grey[200], fontWeight: FontWeight.normal),
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Model or product name'),
                onEditingComplete: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus.unfocus();
                  }
                }),
          ),
          SizedBox(
            height: 15,
          ),
          _form(
              blur: 'L48Dqh0\$01}:00ng-pxw58%1%1D+',
              family: 'S',
              name: 'STRINGED INSTRUMENTS',
              url:
                  'https://cdn.webshopapp.com/shops/179375/files/344232878/500x500x1/resonator.jpg'),
          SizedBox(
            height: 7,
          ),
          _form(
              family: 'W',
              name: 'WIND INSTRUMENTS',
              url:
                  'https://preview.free3d.com/img/2019/05/2158649853872178869/ukustdej-900.jpg',
              blur: 'L5E.FA0P00~S02Rixaxu00n#IpNL'),
          SizedBox(
            height: 7,
          ),
          _form(
              family: 'P',
              name: 'PERCUSSION INSTRUMENTS',
              url:
                  'https://cdn-resources.ableton.com/resources/af/4e/af4e549b-fca2-43c0-9fa0-1f1e085236d8/drum_booth.jpg',
              blur: 'LELc;ur?IAbb1IsnKOa|{1kCPAR*'),
          SizedBox(
            height: 7,
          ),
          _form(
              family: 'K',
              name: 'KEYBOARD INSTRUMENTS',
              url:
                  'https://cdn-resources.ableton.com/resources/62/13/62134aae-2f52-4baf-8df8-414145bb0a8a/electric_keyboards.jpg',
              blur: 'L3MXcb}@8ww|2@R%4UjbD4~CcENG'),
          SizedBox(
            height: 7,
          ),
          _form(
              family: 'E',
              name: 'AUDI EQUIPMENTS',
              url:
                  'https://sg.ishibashi-music.jp/resources/upload/products/11-605953732_1.jpg',
              blur: 'L7ATl?Rj~qxaD*?bM{IU?bt7D%j]'),
          SizedBox(
            height: 7,
          ),
          _form(
              family: 'A',
              name: 'ACCESSORIES',
              url:
                  'https://img.joomcdn.net/446c2fc2b2b9bbf35e0e3404666eead0722c21ed_original.jpeg',
              blur: 'LiOg7.ax~q%M?wofRja#nOt7RjRj'),
        ],
      ),
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

  Widget _form({String name, String url, String blur, String family}) {
    return GestureDetector(
      onTap: () => _goToProductsOverviewScreen(family, context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OctoImage(
                image: NetworkImage(
                  url,
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(blur),
                height: 130,
                width: 130,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              IconButton(
                  icon: Icon(
                    LineIcons.angleRight,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _goToProductsOverviewScreen(family, context);
                    print(name);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

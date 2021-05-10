import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/model/card.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:olamusic/screens/user%20settings/OrdersList.dart';
import 'package:olamusic/screens/user%20settings/PaymentCard.dart';
import 'package:olamusic/screens/user%20settings/Support.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

const _url =
    'https://market.yandex.kz/product--elektrogitara-cort-kx5/7076149?lr=0';

class FrontLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _goToDefinedScreen(context, OrdersList()),
            child: DecoratedBox(
              decoration: formStyle(),
              child: ListTile(
                leading: Icon(
                  Icons.table_chart_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  'Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => _goToDefinedScreen(context, OrdersList()),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: formStyle(),
            child: ListTile(
              leading: Icon(
                LineIcons.globe,
                color: Colors.black,
              ),
              title: Text(
                'Visit Website',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => _launchURL()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => _goToDefinedScreen(context, PaymentCard()),
            child: DecoratedBox(
              decoration: formStyle(),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  'Online Payment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => _goToDefinedScreen(
                    context,
                    PaymentCard(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => _goToDefinedScreen(
              context,
              Support(),
            ),
            child: DecoratedBox(
              decoration: formStyle(),
              child: ListTile(
                leading: Icon(
                  Icons.contact_support,
                  color: Colors.black,
                ),
                title: Text(
                  'Support',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => _goToDefinedScreen(
                    context,
                    Support(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: formStyle(),
            child: ListTile(
                leading: Icon(
                  Icons.vpn_key_sharp,
                  color: Colors.black,
                ),
                title: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {})),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: formStyle(),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Provider.of<Data>(context, listen: false).clearStarred();
                  Provider.of<OlaUser>(context, listen: false).clearData();
                },
                child: Icon(
                  Icons.login,
                  color: Colors.red[700],
                ),
              ),
              title: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Provider.of<Data>(context, listen: false).clearStarred();
                  Provider.of<OlaUser>(context, listen: false).clearData();
                  Provider.of<DataCard>(context, listen: false).clearData();
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration formStyle() {
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

  void _goToDefinedScreen(BuildContext context, dynamic screen) {
    pushNewScreen(
      context,
      screen: screen,
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}

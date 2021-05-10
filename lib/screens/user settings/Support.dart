import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:olamusic/screens/user%20settings/AskPage.dart';
import 'package:olamusic/screens/user%20settings/Faq.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Support',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          children: [
            GestureDetector(
              onTap: () => _phoneCall('tel:+88005553535'),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(29, 29, 29, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.support_agent,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Call Center',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () => _goToDefinedScreen(context, FAQ()),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(29, 29, 29, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.question_answer,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'FAQ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () => _goToDefinedScreen(context, AskPage()),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(29, 29, 29, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        LineIcons.pen,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Ask Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(29, 29, 29, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.coronavirus_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                      Text(
                        'Covid-19',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _phoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _goToDefinedScreen(BuildContext context, dynamic screen) {
    pushNewScreen(
      context,
      screen: screen,
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}

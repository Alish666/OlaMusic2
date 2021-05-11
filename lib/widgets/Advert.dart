import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.canva.com/create/facebook-covers/';

class Advert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            OctoImage(
              image: NetworkImage(
                  'https://assets.materialup.com/uploads/53dc2278-1533-4f65-8a48-5ce5634f719e/preview.jpg'),
              placeholderBuilder: (context) => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ),
              fit: BoxFit.fitWidth,
              width: double.maxFinite,
              height: 250,
            ),
            Container(
              child: Text(
                'ADVERTISEMENT',
                style: TextStyle(color: Colors.blue[900]),
              ),
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}


// OctoPlaceholder.blurHash(
//                 'LDIEReBq,.00%2IqS5.T-oIAJV',
//               )
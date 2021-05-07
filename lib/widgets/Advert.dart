import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class Advert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            OctoImage(
              image: NetworkImage(
                  'https://assets.materialup.com/uploads/53dc2278-1533-4f65-8a48-5ce5634f719e/preview.jpg'),
              placeholderBuilder: OctoPlaceholder.blurHash(
                'LDIEReBq,.00%2IqS5.T-oIAJV',
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
}

import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

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
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of'),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Walden D550',
              url: 'https://i.imgur.com/BU8hjHN.png',
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of'),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Walden D550',
              url: 'https://i.imgur.com/BU8hjHN.png',
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of'),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Walden D550',
              url: 'https://i.imgur.com/BU8hjHN.png',
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of'),
          SizedBox(
            width: 15,
          ),
          _PopularItem(
              name: 'Walden D550',
              url: 'https://i.imgur.com/BU8hjHN.png',
              blurhash: 'LkR{lRog?waztQWBV[of%hWBM_of')
        ],
      ),
    );
  }

  Widget _PopularItem(
      {@required String name,
      @required String url,
      @required String blurhash}) {
    return GestureDetector(
      onTap: () {},
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
}

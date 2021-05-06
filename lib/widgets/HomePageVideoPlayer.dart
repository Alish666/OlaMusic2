import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class HomePageVideoPlayer extends StatefulWidget {
  @override
  _HomePageVideoPlayerState createState() => _HomePageVideoPlayerState();
}

class _HomePageVideoPlayerState extends State<HomePageVideoPlayer> {
  bool _isClickedOne = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 230,
      child: Stack(alignment: Alignment.center, children: [
        OctoImage(
          image: NetworkImage('https://i.ibb.co/3phzhy5/111.jpg'),
          placeholderBuilder: OctoPlaceholder.blurHash(
            'LVF}o^Ne9aM{~AR,IpjtVrkCa#n\$',
          ),
          fit: BoxFit.fitWidth,
          width: double.maxFinite,
          height: 170,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        Positioned(
          bottom: 98,
          left: 167,
          child: IconButton(
              icon: Icon(
                Icons.play_arrow,
                size: 50,
                color: _isClickedOne ? Colors.red : Colors.grey[300],
              ),
              onPressed: () {
                setState(() {
                  _isClickedOne = !_isClickedOne;
                });
              }),
        ),
        Positioned(
          bottom: 12,
          child: Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isClickedOne = !_isClickedOne;
                });
              },
              child: Text(
                'SEE JAMES HETFIELDS ESP JH IRON CROSS',
                style: TextStyle(
                    color: _isClickedOne ? Colors.red : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),
        ),
      ]),
    );
  }
}

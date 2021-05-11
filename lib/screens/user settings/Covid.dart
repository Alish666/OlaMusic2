import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Covid-19 Info',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 250,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Color.fromRGBO(35, 35, 35, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'COVID-19 Information Center',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.medical_services,
                    size: 55,
                    color: Colors.greenAccent[400],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'The latest COVID-19 infromation post, as well as tips to protect you and your family',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Facts About COVID-19',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Source: World Health Organization',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(35, 35, 35, 1),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 15, right: 15),
              child: Column(
                children: [
                  listForm(
                      'COVID-19 vaccine development was accelerated without impacting safety',
                      LineIcons.medicalClinic,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'Vaccines are throughly tested for safety they are approved',
                      LineIcons.hourglass,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'Vaccine side effects are usually mild',
                      LineIcons.microscope,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'Pneumonia vaccines do not prevent COVID-19',
                      LineIcons.pills,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'Vaccine trials involve a diverse range of volunteers',
                      LineIcons.users,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'You will not be able to make a COVID-19 vaccine at home',
                      LineIcons.prescriptionBottle,
                      'https://www.unicef.org/coronavirus/covid-19'),
                  SizedBox(
                    height: 5,
                  ),
                  listForm(
                      'COVID-19 vaccine trials are following safety and ethical standards',
                      LineIcons.certificate,
                      'https://www.unicef.org/coronavirus/covid-19')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listForm(String title, IconData icon, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        tileColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          color: Colors.white,
          onPressed: () => _launchURL(url),
        ),
      ),
    );
  }

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

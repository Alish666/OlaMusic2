import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Q/A',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(LineIcons.angleLeft),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              _form(
                  question: 'What is application about?',
                  answer:
                      'Application is about online shop for getting musical instruments and so on!'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'How do I reset my password?',
                  answer:
                      'To reset your password, you must go to the profile settings and click on the change password button'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'Is it safe to use your personal data?',
                  answer:
                      'All of your personal information is stored on secure servers, so you dont have to worry about your personal data.'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'How do I change my profile?',
                  answer:
                      'To change your profile, go to the profile section, then change the necessary data and click the save changes button'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'What to do when changing a mobile device?',
                  answer:
                      'You can enter your personal account from any mobile device, of course, if you remember your username and password.'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'My email is already in use',
                  answer:
                      'If you receive this error, please contact us and we will help you'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question:
                      'How does oLA music differ from other similar applications?',
                  answer:
                      'oLA music is a convenient and easy-to-use application with a huge database of musical instruments, equipment and accessories'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'Where is your store located?',
                  answer:
                      'Our store is located in Almaty, and delivery is carried out throughout Asia as soon as possible'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'Who can see my personal information?',
                  answer:
                      'Only verified administrators can see your personal information on the companys secure servers.'),
              SizedBox(
                height: 10,
              ),
              _form(
                  question: 'How do I delete an account in your application?',
                  answer:
                      'To delete your account, contact support and you will be answered as soon as possible'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form({@required String question, @required String answer}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(25, 25, 25, 1)),
      child: ExpansionCard(
        margin: EdgeInsets.only(top: 1),
        title: ListTile(
          leading: Icon(
            LineIcons.questionCircle,
            size: 30,
            color: Colors.yellow[600],
          ),
          title: Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        // backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 15),
            child: Text(
              answer,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

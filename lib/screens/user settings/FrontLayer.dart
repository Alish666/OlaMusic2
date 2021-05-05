import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olamusic/model/data.dart';
import 'package:olamusic/model/user.dart';
import 'package:provider/provider.dart';

class FrontLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          DecoratedBox(
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
                    onPressed: () {
                      //TODO: implement page switching to Orders Screen
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: formStyle(),
            child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  'Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //TODO: implement page switching to Orders Screen
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
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
                    onPressed: () {
                      //TODO: implement page switching to Orders Screen
                    })),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
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
                    onPressed: () {
                      //TODO: implement page switching to Orders Screen
                    })),
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
                    onPressed: () {
                      //TODO: implement page switching to Orders Screen
                    })),
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
}

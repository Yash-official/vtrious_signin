import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
String? fullName;
String? phoneNum;
String? password;

class DetailsPage extends StatefulWidget {
  DetailsPage(this.userEmail);
  final String? userEmail;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    String? email = widget.userEmail;
    _firestore
        .collection('userData')
        .doc(email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
      fullName = documentSnapshot.get('Full Name');
      phoneNum = documentSnapshot.get('phonenum');
      password = documentSnapshot.get('password');
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Details of the Person',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'please sign in to your account',
            ),
            Text('Full Name : $fullName'),
            Text('email : $email'),
            Text('Phone Number : $phoneNum'),
            Text('password : $password')
          ],
        ),
      ),
    );
  }
}

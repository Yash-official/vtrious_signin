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
  void getUSerData() async {
    await _firestore
        .collection('userData')
        .doc(widget.userEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
      }
      fullName = documentSnapshot.get('Full Name');
      phoneNum = documentSnapshot.get('phonenum');
      password = documentSnapshot.get('password');
    });
  }

  @override
  void initState() {
    super.initState();
    getUSerData();
  }

  @override
  Widget build(BuildContext context) {
    String? email = widget.userEmail;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              'Details of the Person',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'please sign in to your account',
            ),
            SizedBox(
              height: 90,
            ),
            Text('Full Name : $fullName'),
            SizedBox(
              height: 64,
            ),
            Text('email : $email'),
            SizedBox(
              height: 64,
            ),
            Text('Phone Number : $phoneNum'),
            SizedBox(
              height: 64,
            ),
            Text('password : $password')
          ],
        ),
      ),
    );
  }
}

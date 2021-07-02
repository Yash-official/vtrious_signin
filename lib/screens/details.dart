import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class DetailsPage extends StatefulWidget {
  DetailsPage(this.userEmail);
  String userEmail;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    late String fullName;
    Future<void> getUserData() async {
      final userData = await _firestore
          .collection('userData')
          .doc(widget.userEmail)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        fullName = data["Full Name"];
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Details of the Person',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'please sign in to your account',
            ),
            Text('Full Name : $fullName')
          ],
        ),
      ),
    );
  }
}

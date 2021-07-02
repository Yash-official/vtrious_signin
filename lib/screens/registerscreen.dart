import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vtriousapp/screens/details.dart';
import 'package:vtriousapp/widgets/buttons&Fields.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String fullName;
  late String phoneNum;
  @override
  Widget build(BuildContext context) {
    bool istrue = true;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 23),
          child: Column(
            children: [
              Text(
                'Create New Account',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'please fill the form to continue',
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: (70 * 4) + 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                        onchanged: (value) => fullName = value,
                        hinttext: 'Full Name',
                        keyboardtype: TextInputType.name),
                    CustomTextField(
                        onchanged: (value) => email = value,
                        hinttext: 'Email Address',
                        keyboardtype: TextInputType.emailAddress),
                    CustomTextField(
                        onchanged: (value) => phoneNum = value,
                        hinttext: 'Phone Number',
                        keyboardtype: TextInputType.number),
                    PasswordField(
                        ontap: () {
                          setState(() {
                            istrue = !istrue;
                          });
                        },
                        istrue: istrue,
                        onchanged: (value) => password = value),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SignupSigninButton(
                text: 'Sign Up',
                ontap: () async {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  _firestore.collection('userData').doc(email).set({
                    'Full Name': fullName,
                    'email': email,
                    'phonenum': phoneNum,
                    'password': password
                  });
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(email)));
                },
              ),
              SizedBox(
                height: 20,
              ),
              AlreadyHaveorNot(
                  ontap: () => Navigator.pushNamed(context, 'loginscreen'),
                  text1: 'Already have an account ? ',
                  text2: 'Sign In'),
            ],
          ),
        ),
      ),
    );
  }
}

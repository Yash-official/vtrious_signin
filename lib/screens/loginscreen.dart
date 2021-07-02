import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtriousapp/GoogleSignIn/authentication_service.dart';
import 'package:vtriousapp/screens/details.dart';
import 'package:vtriousapp/widgets/buttons&Fields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget _googleSigninButton(context) {
  return GestureDetector(
    onTap: () {
      final provider =
          Provider.of<GoogleSigninProvider>(context, listen: false);
      provider.googleLogin();
      GoogleAuthentication();
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/google.png')),
          SizedBox(
            width: 14.3,
          ),
          Text('Sign In With Google',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              )),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 23),
      height: 70,
      alignment: Alignment.center,
      width: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool istrue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'please sign in to your account',
              ),
              SizedBox(
                height: 70,
              ),
              CustomTextField(
                onchanged: (value) => email = value,
                keyboardtype: TextInputType.emailAddress,
                hinttext: 'Enter Your Email',
              ),
              SizedBox(
                height: 10,
              ),
              PasswordField(
                  onchanged: (value) => password = value,
                  istrue: istrue,
                  ontap: () {
                    setState(() {
                      istrue = !istrue;
                    });
                  }),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text('Forgot Password?'),
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                height: 70,
              ),
              SignupSigninButton(
                ontap: () async {
                  await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(email)));
                },
                text: 'Sign In',
              ),
              SizedBox(
                height: 10,
              ),
              _googleSigninButton(context),
              SizedBox(
                height: 20,
              ),
              AlreadyHaveorNot(
                ontap: () => Navigator.pushNamed(context, 'registerscreen'),
                text1: 'Don\'t have an account ? ',
                text2: 'Sign up',
              )
            ],
          ),
        ),
      ),
    );
  }
}

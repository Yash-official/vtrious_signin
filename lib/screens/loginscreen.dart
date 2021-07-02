import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtriousapp/authentication_service.dart';
import 'package:vtriousapp/screens/details.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
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
              Container(
                width: 330,
                height: 70,
                padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.15)),
                child: TextField(
                    onChanged: (value) => email = value,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Email',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 330,
                height: 70,
                padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.15)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          onChanged: (value) => password = value,
                          obscureText: istrue,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Password',
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          istrue = !istrue;
                        });
                      },
                      child: Image(
                        image: AssetImage('images/Vector.png'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text('Forgot Password?'),
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () async {
                  await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(email)));
                },
                child: Container(
                  child: Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                      )),
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  height: 70,
                  alignment: Alignment.center,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFFC41B09), Color(0xFFDF3907)])),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<GoogleSigninProvider>(context, listen: false);
                  provider.googleLogin();
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
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'registerscreen'),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an account ? ',
                    ),
                    TextSpan(
                        text: 'Sign up', style: TextStyle(color: Colors.orange))
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final currentUser = FirebaseAuth.instance.currentUser!.email;
          return DetailsPage(currentUser);
        },
      ),
    );
  }
}

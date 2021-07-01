import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    Container(
                      width: 330,
                      height: 70,
                      padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.15)),
                      child: TextField(
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Full Name',
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                          )),
                    ),
                    Container(
                      width: 330,
                      height: 70,
                      padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.15)),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address',
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                          )),
                    ),
                    Container(
                      width: 330,
                      height: 70,
                      padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.15)),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                          )),
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
                                obscureText: istrue,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your Password',
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyText2,
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
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'userdetails');
                },
                child: Container(
                  child: Text('Sign Up',
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
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'loginscreen'),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account ? ',
                    ),
                    TextSpan(
                        text: 'Sign In', style: TextStyle(color: Colors.orange))
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

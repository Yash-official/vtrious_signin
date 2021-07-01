import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Vtrious',
                  style: Theme.of(context).textTheme.headline1,
                ),
                TextSpan(
                    text: '.',
                    style: TextStyle(color: Colors.red, fontSize: 35))
              ]),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              width: 214,
              child: Text(
                'Whether we create history or not we are part ofthe history',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 46,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'loginscreen');
              },
              child: Container(
                child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
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
              height: 111,
            )
          ],
        ),
      ),
    );
  }
}

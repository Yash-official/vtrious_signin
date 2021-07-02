import 'package:flutter/material.dart';

class AlreadyHaveorNot extends StatelessWidget {
  const AlreadyHaveorNot(
      {required this.ontap, required this.text1, required this.text2});
  final ontap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: text1,
          ),
          TextSpan(text: text2, style: TextStyle(color: Colors.orange))
        ],
        style: Theme.of(context).textTheme.bodyText1,
      )),
    );
  }
}

class SignupSigninButton extends StatelessWidget {
  SignupSigninButton({required this.ontap, required this.text});
  final ontap;
  final text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Text(text,
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {required this.onchanged,
      required this.hinttext,
      required this.keyboardtype});
  final onchanged;
  final String hinttext;
  final keyboardtype;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 70,
      padding: EdgeInsets.only(left: 33, top: 27, bottom: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.15)),
      child: TextField(
          keyboardType: keyboardtype,
          onChanged: onchanged,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w900),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: Theme.of(context).textTheme.bodyText2,
          )),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField(
      {required this.ontap, required this.istrue, required this.onchanged});
  final ontap;
  final bool istrue;
  final onchanged;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                onChanged: onchanged,
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
            onTap: ontap,
            child: Image(
              image: AssetImage('images/Vector.png'),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

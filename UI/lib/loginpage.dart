import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  Widget _wrapTextWidget(
    @required String firstText,
    @required String secondText,
  ) {
    return Wrap(
      children: [
        Text(
          firstText,
          style: GoogleFonts.andika(
            color: Colors.black54,
            fontSize: 19,
            textStyle: TextStyle(letterSpacing: .5),
          ),
        ),
        Center(
          child: Text(
            secondText,
            style: GoogleFonts.andika(
              color: Colors.black54,
              fontSize: 19,
              textStyle: TextStyle(letterSpacing: .5),
            ),
          ),
        )
      ],
    );
  }

  Widget signUpWithFacebookButton() {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton.icon(
        onPressed: () {},
        icon: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        label: Text("SignUp with Facebook"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 679,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  "Instagram",
                  style: GoogleFonts.cinzel(
                    fontSize: 20,
                    textStyle: TextStyle(letterSpacing: 5),
                  ),
                ),
                _wrapTextWidget("Sign up", "Friend"),
                signUpWithFacebookButton(),
              ],
            ),
          )
        ],
      )),
    );
  }
}

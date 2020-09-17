import 'package:ccc/home_page.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final mypswController = TextEditingController();
  final myusrController = TextEditingController();

  Widget signUpWithFacebookButton() {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton.icon(
        onPressed: () {
          print('object');
          print(mypswController.text);
          print(myusrController.text);
          if (mypswController.text == "aa" && myusrController.text == "batu") {
            print("aaaa");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
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

  Widget textformfield(
      {@required String name, @required TextEditingController a}) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: a,
        decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Color(0xff283848),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              textformfield(name: 'null', a: myusrController),
                              textformfield(name: 'asd', a: mypswController),
                              signUpWithFacebookButton(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xff283848),
              ),
            )
          ],
        ),
      ),
    );
  }
}

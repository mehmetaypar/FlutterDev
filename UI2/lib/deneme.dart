import 'botton.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final mypswController = TextEditingController();
  final myusrController = TextEditingController();

  Widget loginnerButton() {
    return Container(
      height: 40,
      width: double.infinity,
      child: RaisedButton.icon(
        onPressed: () {
          print('object');
          print(mypswController.text);
          print(myusrController.text);
          if (myusrController.text == "mustafa" &&
              mypswController.text == "rifat") {
            print("aaaa");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottom()));
          }
        },
        icon: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        label: Text("Giriş yap"),
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

  Widget cryptictextformfield(
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.66,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              textformfield(
                                  name: 'Kullanıcı adınız', a: myusrController),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              textformfield(
                                  name: 'Şifreniz', a: mypswController),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              loginnerButton(),
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xff283848),
              ),
            )
          ],
        ),
      ),
    );
  }
}

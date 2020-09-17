import 'botton.dart';
import 'package:flutter/material.dart';
import 'package:ccc/listview/MOCK_DATA.dart';

class Sorgu extends StatefulWidget {
  @override
  SorguState createState() => SorguState();
}

class SorguState extends State<Sorgu> {
  final bandNoController = TextEditingController();
  final urunKoduController = TextEditingController();
  final zamanController = TextEditingController();

  void stateChanger() {
    setState(() {
      print("aaaa");
/*
      sorguSayisi = itemQuerryS(
              itemQuerryS(ddata, "band", (bandNoController.text)),
              "kodu",
              (urunKoduController.text))
          .length
          .toString();
*/
      sorguSayisi = (hourQuerry(
              itemQuerryS(itemQuerryS(ddata, "band", (bandNoController.text)),
                  "kodu", (urunKoduController.text)),
              "zaman",
              zamanController.text)
          .length
          .toString());
      sorguSonuc =
          'Belirtilen alanlarda toplam \n  $sorguSayisi Adet \n ürün imal edilmiştir';
      print(sorguSayisi);
    });
  }

  // ignore: non_constant_identifier_names
  String sorguSonuc = "";
  String sorguSayisi = "";

  Widget querryButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: RaisedButton.icon(
        onPressed: () {
          print('object');
          print(bandNoController.text == "");
          print(urunKoduController.text);

          stateChanger();
          //Navigator.push(
          //    context, MaterialPageRoute(builder: (context) => Bottom()));
          //}
        },
        icon: Container(
          height: 85,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        label: Text("Sorgula"),
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
          //alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: Column(
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
                                  name: 'Band No', a: bandNoController),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              textformfield(
                                  name: 'Ürünün kodu', a: urunKoduController),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              textformfield(
                                  name: 'Ürünün Üretim Saati',
                                  a: zamanController),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              Text(
                                sorguSonuc,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: 5,
                              ),
                              querryButton(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ), /*
            Padding(
              padding: EdgeInsets.only(top: 140),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xff283848),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

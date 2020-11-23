import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
return ProductAddState();
  }

}

class ProductAddState extends State {
  DBhelper dbHelper=DBhelper();
  TextEditingController txtName=TextEditingController();
  TextEditingController txtDescription=TextEditingController();
  TextEditingController txtUnitPrice=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),////////////////MediaQuery.of(context).size.height*0.2,
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceField(),
//ID yok o veri tabanında          buildField(),

        buildSaveButton(),
        ],
      ),
      ),

    );

  }

   buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Name"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Description"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Unit Price"),
    controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return FlatButton(
        onPressed: (){addProduct();},


        child: Text("Add"));
  }

  void addProduct()async {
    var result = await dbHelper.insert(Product(name:txtName.text,description: txtDescription.text,unitPrice: double.tryParse(txtUnitPrice.text)));

    Navigator.pop(context,true);
  }


}
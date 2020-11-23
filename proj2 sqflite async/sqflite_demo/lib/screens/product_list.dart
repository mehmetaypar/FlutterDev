import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import 'package:sqflite_demo/screens/product_detail.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State {


  DBhelper dbHelper = new DBhelper();
  List<Product> Products;
  int productCount = 0;



  @override
  void initState() {
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "yeni ürün ekle",
      ),

    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.cyan,
            elevation: 2.0, //büyüklüğü
            //// elevation:MediaQuery.of(context).size.height*0.2,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Text("ürün kodu"),
                ),
                title: Text(this.Products[position].name),
                subtitle: Text(this.Products[position].description),
                onTap: () {goToDetail(this.Products[position]);}),
          );
        });
  }

  void goToProductAdd() async {
    bool result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductAdd(),
        ));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    var productFuture = dbHelper.getProducts();
    productFuture.then((data) {
    setState(() {

        this.Products = data;
        productCount = data.length;
      });
    });
  }

  void goToDetail(Product product)async {
    bool result= await Navigator.push(
        context, MaterialPageRoute(builder:(context)=>ProductDetail(product)));
if(result!=null && result)
{
  getProducts();
}
  }
}

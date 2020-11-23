import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;

  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                  "https://img01.imgsinemalar.com/images/karakter_buyuk/2419/Shrek-5.jpg"),
              height: 120,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()+" \$",style: TextStyle(fontSize: 17, color: Colors.blueGrey),),
          ],
        ),
      ),
    );
  }
}

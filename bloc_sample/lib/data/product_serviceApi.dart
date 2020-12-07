import 'package:bloc_sample/models/product.dart';

class ProductServiceApi{

  static List<Product> products=new List <Product>();

static ProductServiceApi _singleton= ProductServiceApi._internal();

  ProductServiceApi._internal();

  factory ProductServiceApi(){

    return _singleton;
  }

  static List <Product> getAll(){//dummy data
    products.add(new Product(1, "cabbages", 1));
    products.add(new Product(2, "cabbages", 2));
    products.add(new Product(3, "cabbages", 3));
    products.add(new Product(4, "cabbages", 4));

    return products;
  }



}
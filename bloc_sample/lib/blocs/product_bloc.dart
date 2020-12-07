import 'dart:async';

import 'package:bloc_sample/data/product_serviceApi.dart';
import 'package:bloc_sample/models/product.dart';

class ProductBloc{
  final productStreamController= StreamController.broadcast();

  Stream get getStream=>productStreamController.stream;

  List<Product> getAll(){
    return ProductServiceApi.getAll();
  }

}

final productBloc= ProductBloc();
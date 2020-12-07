import 'dart:async';

import 'package:bloc_sample/data/cart_serviceApi.dart';
import 'package:bloc_sample/models/cart.dart';

class CartBloc{

  final cartStreamController=StreamController.broadcast() ;//const ile aynı referance içindeki değeri değişebilir ama kendisi reassign edilemez

Stream get getStream=> cartStreamController.stream;

void addToCart(Cart item){
  CartServiceApi .addToCart(item);
cartStreamController.sink.add(CartServiceApi.getCart());
  //ÖNEMLİ SİNK
}

void removeFromCart(Cart item){
CartServiceApi.removeFromCart(item);
cartStreamController.sink.add(CartServiceApi.getCart());

}

List <Cart> getCart(){
  return CartServiceApi.getCart();
}


}

final cartBloc=CartBloc();
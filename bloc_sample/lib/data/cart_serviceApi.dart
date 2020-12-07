import 'package:bloc_sample/models/cart.dart';

class CartServiceApi {
  static List<Cart> cartItems = new List<Cart>();

  static CartServiceApi _singleton = CartServiceApi._internal();

  CartServiceApi._internal();

  factory CartServiceApi() {
    return _singleton;
  }

  static void addToCart(Cart Item) {
    cartItems.add(Item);
  }

  static void removeFromCart(Cart Item) {
    cartItems.remove(Item);
  }

  static List<Cart> getCart() {
    return cartItems; }
}

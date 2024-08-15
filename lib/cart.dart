import 'package:afromerkatoecommerce/product/Productcard.dart';

class Cart {
  // Singleton pattern to ensure a single instance of Cart
  Cart._privateConstructor();
  static final Cart _instance = Cart._privateConstructor();
  factory Cart() => _instance;

  List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
  }

  void removeFromCart(Product product) {
    _items.remove(product);
  }
}

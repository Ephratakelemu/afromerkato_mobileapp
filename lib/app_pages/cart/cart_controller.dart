import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  var cartItems = <Product>[].obs;

  // Calculate total price as an observable
  double get totalPrice => cartItems.fold(0, (total, item) => total + item.price * item.quantity);

  int get totalItems => cartItems.length;

  void addToCart(Product item) {
    final existingItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(item);
    }
    // Trigger a refresh after updating the quantity
    cartItems.refresh();
  }

  void removeFromCart(Product item) {
    cartItems.remove(item);
  }

  void incrementQuantity(Product item) {
    final cartItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (cartItem != null) {
      cartItem.quantity++;
      // Trigger a refresh after updating the quantity
      cartItems.refresh();
    }
  }

  void decrementQuantity(Product item) {
    final cartItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (cartItem != null && cartItem.quantity > 1) {
      cartItem.quantity--;
      // Trigger a refresh after updating the quantity
      cartItems.refresh();
    }
  }
}

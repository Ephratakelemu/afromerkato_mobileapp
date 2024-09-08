import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController{
  var cartItems = <Product>[].obs;
 var quantity = 1.obs;
 void addToCart(Product item) {
    final existingItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (existingItem != null) {
      existingItem.quantity++;
      cartItems.refresh(); 
    } else {
      cartItems.add(item);
    }
  }

  void removeFromCart(Product item) {
    cartItems.remove(item);
  }

  void incrementQuantity(Product item) {
    final cartItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (cartItem != null) {
      cartItem.quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(Product item) {
    final cartItem = cartItems.firstWhereOrNull((i) => i.name == item.name && i.selectedColor == item.selectedColor && i.selectedSize == item.selectedSize);
    if (cartItem != null && cartItem.quantity > 1) {
      cartItem.quantity--;
      cartItems.refresh(); 
    }
  }

  double calculateTotalPrice() {
    return cartItems.fold(0, (total, item) => total + item.price * item.quantity);
  }

  int get totalItems => cartItems.length;
}

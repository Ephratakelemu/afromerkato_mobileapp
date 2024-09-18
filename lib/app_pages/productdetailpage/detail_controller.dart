import 'package:afromerkatoecommerce/app_pages/cart/cart_view.dart';
import 'package:afromerkatoecommerce/app_pages/product/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:afromerkatoecommerce/app_pages/cart/cart_controller.dart';

class ProductDetailController extends GetxController {
  final Product product;
   RxInt stock = 10.obs; // Remaining stock for the product
  RxInt soldItems = 0.obs; // Sold items for the product

  RxInt quantity = 1.obs;
  Rx<Color?> selectedColor = Rx<Color?>(null);
  Rx<String?> selectedSize = Rx<String?>(null);
  RxDouble currentRating = 3.5.obs;
  RxInt selectedMenuIndex = 0.obs;
  RxInt currentPage = 0.obs;

  // Update stock based on item purchase
  void decrementStock() {
    if (stock > 0) {
      stock--;
      soldItems++;
    }
  }

  // Reviews
  RxList<Map<String, dynamic>> reviews = RxList<Map<String, dynamic>>([]);

  late PageController pageController;

  ProductDetailController({required this.product});

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(updatePageIndex);
    
    // Add initial reviews if any
    reviews.addAll([
      {'review': 'Great product!', 'rating': 5},
      {'review': 'Not as expected.', 'rating': 3},
    ]);
    
    
    super.onInit();
  }

  @override
  void onClose() {
    pageController.removeListener(updatePageIndex);
    pageController.dispose();
    super.onClose();
  }

  void updatePageIndex() {
    currentPage.value = pageController.page?.round() ?? 0;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) quantity--;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void selectColor(Color color) {
    selectedColor.value = color;
  }

void addToCart() {
  // Check if enough stock is available
  if (quantity.value <= stock.value) {
    // Decrement stock and update sold items
    decrementStock();

    // Add to cart
    Cartcontroller().addToCart(product.copyWith(
      selectedColor: selectedColor.value?.toString(),
      selectedSize: selectedSize.value,
      quantity: quantity.value,
    ));
    
    // Navigate to cart view
    Get.to(() => CartView());
  } else {
    // Show stock error message
    Get.snackbar('Stock Error', 'Not enough stock available.');
  }
}


  void showBottomSheet() {
    Get.bottomSheet(
      BottomSheetPage(
        image: Image.asset(product.image),
        price: product.price,
        selectedColor: selectedColor.value,
        selectedSize: selectedSize.value,
        quantity: quantity.value,
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
    );
  }

  // Method to add a new review
  void addReview(String reviewText, int rating) {
    reviews.add({'review': reviewText, 'rating': rating});
  }
}

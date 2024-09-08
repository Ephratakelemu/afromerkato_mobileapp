import 'package:afromerkatoecommerce/app_pages/cart/cart_view.dart';
import 'package:afromerkatoecommerce/app_pages/product/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:afromerkatoecommerce/app_pages/cart/cart_controller.dart';

class ProductDetailController extends GetxController {
  final Product product;
  
  RxInt quantity = 1.obs;
  Rx<Color?> selectedColor = Rx<Color?>(null);
  Rx<String?> selectedSize = Rx<String?>(null);
  RxDouble currentRating = 3.5.obs;
  RxInt selectedMenuIndex = 0.obs;
  RxInt currentPage = 0.obs;

  late PageController pageController;

  ProductDetailController({required this.product});

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(updatePageIndex);
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
  
    Cartcontroller().addToCart(product.copyWith(
      selectedColor: selectedColor.value?.toString(),
      selectedSize: selectedSize.value,
      quantity: quantity.value,
    ));
    Get.to(() => CartView());
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
}

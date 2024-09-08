import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
var products = <Product>[].obs;

  void toggleFavorite(int index) {
    products[index] = products[index].copyWith(
      isFavorited: !products[index].isFavorited,
    );
  }
 void addToCart(Product product) {
   print("${product.name} added to cart");
  }
}

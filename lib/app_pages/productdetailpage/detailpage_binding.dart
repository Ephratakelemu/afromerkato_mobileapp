import 'package:afromerkatoecommerce/app_pages/productdetailpage/detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinding extends Bindings {
  final dynamic product; 
ProductDetailBinding({required this.product});
@override
  void dependencies() {
     Get.lazyPut<ProductDetailController>(() => ProductDetailController(product: product),);
   }
}

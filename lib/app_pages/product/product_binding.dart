import 'package:afromerkatoecommerce/app_pages/product/product_controller.dart';
import 'package:get/get.dart';
class ProductBinding extends Bindings{
 @override
  void dependencies() {
    Get.lazyPut<ProductController>(()=> ProductController(),);
  } 
}
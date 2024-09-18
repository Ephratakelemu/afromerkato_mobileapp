import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/category/category_controller.dart';


class CategoryBinding extends Bindings{
 @override
  void dependencies() {
    Get.lazyPut<AllCategoriesController>(()=> AllCategoriesController(),);
  } 
}
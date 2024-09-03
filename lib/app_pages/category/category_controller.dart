import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/category/model.dart';

class CategoryController extends GetxController{
   var selectedCategory = Rx<Category?>(null);
  var selectedSubCategory = Rx<SubCategory?>(null);

  void setSelectedCategory(Category? category) {
    selectedCategory.value = category;
    selectedSubCategory.value = null; 
  }

  void setSelectedSubCategory(SubCategory? subCategory) {
    selectedSubCategory.value = subCategory;
  }

}
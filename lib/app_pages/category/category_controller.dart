import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/category/model.dart';

class CategoryController extends GetxController{
   var selectedCategory = Rx<Category?>(null);
  var selectedSubCategory = Rx<SubCategory?>(null);

    var itemsData = <String, List<Map<String, String>>> {}.obs;

  void updateItemsData(String subCategoryName, List<Map<String, String>> items) {
    itemsData[subCategoryName] = items;
  }

  List<Map<String, String>> getItemsForSubCategory(String subCategoryName) {
    return itemsData[subCategoryName] ?? [];
  }

  void setSelectedCategory(Category? category) {
    selectedCategory.value = category;
    selectedSubCategory.value = null; 
  }

  void setSelectedSubCategory(SubCategory? subCategory) {
    selectedSubCategory.value = subCategory;
  }

}
import 'package:get/get.dart';

class ProductController extends GetxController {
  var itemsData = <String, List<Map<String, String>>> {}.obs;

  void updateItemsData(String subCategoryName, List<Map<String, String>> items) {
    itemsData[subCategoryName] = items;
  }

  List<Map<String, String>> getItemsForSubCategory(String subCategoryName) {
    return itemsData[subCategoryName] ?? [];
  }
}

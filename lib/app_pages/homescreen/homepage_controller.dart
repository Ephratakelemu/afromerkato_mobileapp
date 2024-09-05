import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/searches/searchresult_view.dart';

class HomepageController extends GetxController {
  var selectedIndex = 0.obs;
void onItemTapped(int index) {
    selectedIndex.value = index;
 }
   var searchQuery = ''.obs;
   void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void onSearchSubmitted() {
    Get.to(() => SearchResultsPage(query: searchQuery.value));
  }

}
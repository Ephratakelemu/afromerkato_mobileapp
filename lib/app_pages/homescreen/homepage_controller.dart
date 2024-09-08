import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/searchpage/searchresultpage.dart';

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
    Get.to(() => SearchResultsPage(query: '',),arguments:  searchQuery.value);
  }
  void main() {
  Get.put(HomepageController(), permanent: true);
  
}

}
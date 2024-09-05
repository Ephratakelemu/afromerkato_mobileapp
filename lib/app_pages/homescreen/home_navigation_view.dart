
import 'package:afromerkatoecommerce/app_pages/homescreen/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart/cart_view.dart';
import 'package:afromerkatoecommerce/app_pages/account/account_view.dart';
import 'home_view.dart';

class Pageview extends GetView<HomepageController>{
  Pageview({super.key});
   final HomepageController controller = Get.put(HomepageController());
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: <Widget>[
            HomePageview(),
            CartView(),
            AccountView(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.blue,
          onTap: controller.onItemTapped,
        );
      }),
    );
  }

}





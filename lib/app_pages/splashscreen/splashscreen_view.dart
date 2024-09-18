import 'package:afromerkatoecommerce/app_pages/homescreen/home_navigation_view.dart';
import 'package:afromerkatoecommerce/app_pages/sign_pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/splashscreen/splashscreen_controller.dart';


class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(20),
     child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/images/BAZAR (2).jpg'),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(onPressed: (){
               Get.offAll(() => Pageview());
                 },
               style: ElevatedButton.styleFrom(
                backgroundColor:Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
               
              ),
              child: const Text("Take a look",
              style: TextStyle(color: Colors.white, fontSize:20),)),
            ),
            const SizedBox(height: 20,),
             const SizedBox(height: 20),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SignInPage()); // Navigate to the SignInPage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}


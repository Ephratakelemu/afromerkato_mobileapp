import 'package:afromerkatoecommerce/app_pages/homescreen/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GetstartedView extends GetView<GetstartedController> {
  const GetstartedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/images/BAZAR (2).jpg'),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(onPressed:() => Get.toNamed(HomePage as String), 
              child: const Text("Take a look",
              style: TextStyle(color: Colors.white),)),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      )
    );
  }
}

class GetstartedController {
}
import 'package:get/get.dart';
import 'homepage_controller.dart';
class HomeBinding extends Bindings{
  @override
void dependencies(){
Get.lazyPut<HomepageController>(()=>HomepageController(),);
}
  
}
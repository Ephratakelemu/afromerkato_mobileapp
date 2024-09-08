import 'package:get/get.dart';
import 'success_controller.dart';

class successscreenbinding extends Bindings{
 @override
 void dependencies(){
  Get.lazyPut<OrderSuccessController>(()=>OrderSuccessController(),);
 }
}
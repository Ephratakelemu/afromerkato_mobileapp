// import 'package:afromerkatoecommerce/app_pages/order_success/success_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class OrderSuccessScreenView extends GetView<OrderSuccessController>{
//   @override
//   Widget build(BuildContext context) {
//     final OrderSuccessController controller = Get.put(OrderSuccessController());

//     return Scaffold(
//       body: Container(
//         color: Colors.blue, 
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ScaleTransition(
//                 scale: controller.animation,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.white,
//                   child: Icon(
//                     Icons.check,
//                     color: Colors.blue,
//                     size: 50,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Order Placed!',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Your order was placed successfully.',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

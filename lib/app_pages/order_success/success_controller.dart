import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderSuccessController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void onInit() {
    super.onInit();

    // Initialize the AnimationController and set its duration
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut, // bounce effect
      ),
    );

   
    _animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(PageView()); 
    });
  }

  @override
  void onClose() {
   
    _animationController.dispose();
    super.onClose();
  }

  Animation<double> get animation => _animation;
}

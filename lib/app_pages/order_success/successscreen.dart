import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/homescreen/home_navigation_view.dart';
class OrderSuccessScreen extends StatefulWidget {
  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and set its duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut, // Add bounce effect
      ),
    );

    // Start the animation
    _controller.forward();

    // Delay for a few seconds and then navigate to the pageview
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(Pageview());
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Set the background color to blue
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.check,
                    color: Colors.blue, 
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
              const SizedBox(height: 10), 
              const Text(
                'Your order was placed successfully.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


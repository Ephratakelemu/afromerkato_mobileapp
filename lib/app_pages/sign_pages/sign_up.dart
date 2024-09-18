import 'package:afromerkatoecommerce/app_pages/homescreen/home_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'afromerkato',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 80),

              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.blue),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),

            
              ElevatedButton(
                onPressed: () {
                  String fullName = fullNameController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;

                  if (fullName.isNotEmpty &&
                      email.isNotEmpty &&
                      phone.isNotEmpty &&
                      password.isNotEmpty) {
                  
                    Get.snackbar(
                      'Success',
                      'Account created successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    Get.off(()=>Pageview());
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please fill in all the fields.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:afromerkatoecommerce/app_pages/homescreen/home_navigation_view.dart';
import 'package:afromerkatoecommerce/app_pages/sign_pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        
        child:Padding(
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
              'Sign In',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),

            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ), 
              ),
              keyboardType: TextInputType.emailAddress,
              maxLines: 1, 
            ),

            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ), 
              ),
              obscureText: true,
              maxLines: 1, 
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                if (email.isNotEmpty && password.isNotEmpty) {
                  Get.offAll(() => Pageview());
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter both email and password.',
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
              child: const Text('Sign In',style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Get.to(() => const SignUpPage());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      )
    );
  }
}

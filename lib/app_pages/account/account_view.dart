import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/account/account_controller.dart';

class AccountView extends GetView<AccountController> {
  AccountView({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //profile section
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Name\nEmail  ',
                        
                     style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),  
                      ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Add functionality for editing profile
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),

        
          Expanded(
            child: ListView(
              children: [
                ListTile(leading: Icon(Icons.location_on, color: Colors.blue,), title: Text("Shipping Address"),),
                ListTile(leading: Icon(Icons.payment,color: Colors.blue,),title: Text("Payment Method"),),
                ListTile(leading: Icon( Icons.history, color: Colors.blue,), title:Text ("Order History"),),
                 ListTile(leading: Icon (Icons.delivery_dining, color: Colors.blue,), title: Text('Delivery Status'),),
                 ListTile(leading: Icon (Icons.language, color: Colors.blue,),title: Text('Language'),),
                 ListTile(leading: Icon (Icons.favorite, color: Colors.blue,), title: Text('Favorite'),),
                 ListTile(leading: Icon (Icons.lock, color: Colors.blue,), title: Text('Privacy Policy'),),
                 ListTile(leading: Icon (Icons.question_answer, color: Colors.blue,), title:Text('Frequently Asked Questions'),),
                 ListTile(leading: Icon (Icons.info, color: Colors.blue,), title: Text('Legal Information'),),
                 ListTile(leading: Icon (Icons.star_rate, color: Colors.blue,), title: Text('Rate Our App'),),
              ],
            ),
          ),
          // Logout Button
          Container(
           color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('LogOut'),
              onTap: () {
                // functionality for logout
              },
              tileColor: Colors.white, 
            ),
          ),
        ],
      ),
    );
  }

}

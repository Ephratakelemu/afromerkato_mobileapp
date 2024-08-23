import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
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
                      Text(
                        'Name\nName@email.com', // Replace with the actual name
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
          const SizedBox(height: 24.0),

          // Menu Section
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(Icons.location_on, 'Shipping Address'),
                _buildMenuItem(Icons.payment, 'Payment Method'),
                _buildMenuItem(Icons.history, 'Order History'),
                _buildMenuItem(Icons.delivery_dining, 'Delivery Status'),
                _buildMenuItem(Icons.language, 'Language'),
                _buildMenuItem(Icons.favorite, 'Favorite'),
                _buildMenuItem(Icons.lock, 'Privacy Policy'),
                _buildMenuItem(Icons.question_answer, 'Frequently Asked Questions'),
                _buildMenuItem(Icons.info, 'Legal Information'),
                _buildMenuItem(Icons.star_rate, 'Rate Our App'),
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

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        // functionality of each menu item
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:get/get.dart';
import'package:afromerkatoecommerce/app_pages/order_success/success_view.dart';

class CheckOutView extends GetView {
  final List<Product> cartItems;
  final int totalItems;
  final double totalPrice;

  CheckOutView({
    required this.cartItems,
    required this.totalItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "CheckOut",
          style: TextStyle(fontSize: 26),
        ),
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Full Name\nPhone\nState\nCountry',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          PaymentSection(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text(
              'Items $totalItems',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         Expanded(
  child: cartItems.isEmpty
      ? const Center(child: Text('Your cart is empty'))
      : ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return Container(
              color: Colors.white, 
              margin: const EdgeInsets.all(4.0),
              child: Card(
              child: Row(
                  children: [
                    Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (item.selectedColor != null)
                                    Text(
                                      'Color: ${item.selectedColor}',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  if (item.selectedSize != null)
                                    Text(
                                      'Size: ${item.selectedSize}',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  Text(
                                    '\$${item.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
)

        ],
      ),
       bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(OrderSuccessScreenView());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(150, 50), // Fixed size for the button
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSection extends StatelessWidget {
  PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Text(
             'Payment Method', 
             style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
         
          ),
        
        const SizedBox(height: 16.0),
        Row(
          children: [
            Container(
       color: Colors.blue,
          width: 150,
              height: 80,
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/mastercard2.png', 
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16.0),
            const Text(
              "MasterCard ****0000",
              style: TextStyle(fontSize: 20.0, color: Colors.blue,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
      )
    );

  }
}



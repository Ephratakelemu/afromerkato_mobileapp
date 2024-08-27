import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/cart/cart_controller.dart';
import 'package:afromerkatoecommerce/app_pages/product/Productcard.dart';
import 'package:afromerkatoecommerce/app_pages/cart/checkoutpage.dart';



class CartView extends GetView<Cartcontroller> {
  CartView({Key? key}):super(key:key);
  
 @override
  Widget build(BuildContext context) {
    final Cartcontroller controller=Get.put(Cartcontroller());


    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body:  Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        }
         return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return Dismissible(
              key: Key(item.name + item.price.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                controller.removeFromCart(item);
              },
                  background: Container(
                    color: Colors.white, 
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                 
                         child: Card(
                     margin: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,),
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
                                          ' ${item.selectedColor}',
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () => controller.incrementQuantity(item),
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 11.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '${item.quantity}',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed:  () => controller.decrementQuantity(item),
                                      color: Colors.grey,
                                   ),
                              ],
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
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${controller.calculateTotalPrice().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(
                      cartItems:controller. cartItems,
                      totalItems: controller.totalItems,
                      totalPrice: controller.calculateTotalPrice(),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(150, 50), 
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



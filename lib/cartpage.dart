import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/cart.dart';
import 'package:afromerkatoecommerce/product/Productcard.dart';
import 'package:afromerkatoecommerce/checkoutpage.dart';



class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> cartItems = Cart().items;

    double _calculateTotalPrice() {
      double total = 0.0;
      for (var item in cartItems) {
        total += item.price * _quantity; 
      }
      return total;
    }

    int _totalItems() {
      return cartItems.length;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Dismissible(
                  key: Key(item.name + item.price.toString()), 
                  direction: DismissDirection.endToStart, 
                  onDismissed: (direction) {
                    Cart().removeFromCart(item);
                  },
                  background: Container(
                    color: Colors.white, 
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.blue,
                      size: 40.0,
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
                                      onPressed: _incrementQuantity,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 11.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        '$_quantity',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: _decrementQuantity,
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
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${_calculateTotalPrice().toStringAsFixed(2)}',
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
                      cartItems: cartItems,
                      totalItems: _totalItems(),
                      totalPrice: _calculateTotalPrice(),
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

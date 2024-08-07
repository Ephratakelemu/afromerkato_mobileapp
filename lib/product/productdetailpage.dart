import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/product/Productcard.dart'; 

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;
  String? _selectedSize; // State variable for selected size

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

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      widget.product.image,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Product Name and Price
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Select Color
                  const Text(
                    'Select Color:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _colorOption(Colors.red),
                      const SizedBox(width: 8.0),
                      _colorOption(Colors.green),
                      const SizedBox(width: 8.0),
                      _colorOption(Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  // Select Size
                  const Text(
                    'Select Size:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _sizeOption('4'),
                      const SizedBox(width: 8.0),
                      _sizeOption('4.5'),
                      const SizedBox(width: 8.0),
                      _sizeOption('5'),
                      const SizedBox(width: 8.0),
                      _sizeOption('6.5'),
                      const SizedBox(width: 8.0),
                      _sizeOption('7'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Quantity Selector
                  const Text(
                    'Quantity:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _decrementQuantity,
                        icon: const Icon(Icons.remove),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '$_quantity',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _incrementQuantity,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to Cart action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Adjust radius here
                      ),
                      minimumSize: Size(double.infinity, 50), // Set width and height
                    ),
                    child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16.0), // Space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Buy Now action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Adjust radius here
                      ),
                      minimumSize: Size(double.infinity, 50), // Set width and height
                    ),
                    child: const Text('Buy Now', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorOption(Color color) {
    return GestureDetector(
      onTap: () {
        // Handle color selection
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
      ),
    );
  }

  Widget _sizeOption(String size) {
    bool isSelected = size == _selectedSize; // Check if this size is selected
    return GestureDetector(
      onTap: () => _selectSize(size), // Update selected size
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300], // Blue background if selected
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : Colors.black, // White text if selected
          ),
        ),
      ),
    );
  }
}

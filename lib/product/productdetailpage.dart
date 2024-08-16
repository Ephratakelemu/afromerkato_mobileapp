import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:afromerkatoecommerce/product/Productcard.dart';
import 'package:afromerkatoecommerce/product/bottomsheet.dart';
import 'package:afromerkatoecommerce/cart.dart'; 
import 'package:afromerkatoecommerce/cartpage.dart'; 
class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;
  String? _selectedSize;
  Color? _selectedColor;
  double _currentRating = 3.5; 
  int _selectedMenuIndex = 0; // Track the selected menu
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController
    _pageController.addListener(_updatePageIndex); // Listen to page changes
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePageIndex); // Remove listener
    _pageController.dispose(); // Dispose of the PageController when done
    super.dispose();
  }

  void _updatePageIndex() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0; // Update the current page index
    });
  }

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  void _selectColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }
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
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          quantity: _quantity,
          selectedSize: _selectedSize,
          onContinue: () {
            Navigator.pop(context); // Close bottom sheet
          },
        );
      },
    );
  }

void _addToCart() {
  // Create a new product with selected details
  Product productWithDetails = widget.product.copyWith(
    selectedColor: _selectedColor?.toString(),
    selectedSize: _selectedSize,
    quantity: _quantity,
  );

  // Add the product to the cart
  Cart().addToCart(productWithDetails);




  // Navigate to CartPage
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartPage()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            // PageView for scrolling images one by one
            SizedBox(
              height: 300.0, // Height of images
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                 
                  ...widget.product.additionalImages.map((image) {
                    return Image.asset(
                      image,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
         
            Center(
              child: _buildDotIndicator(),
            ),
            const SizedBox(height: 10.0),
           
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: _currentRating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.0, // Adjust the size of the stars
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0.0), // Reduce padding between stars
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.blue, // Blue stars
                        ),
                        unratedColor: Colors.grey[300], // Light gray color for unselected stars
                        onRatingUpdate: (rating) {
                          setState(() {
                            _currentRating = rating; // Update the current rating
                          });
                        },
                      ),
                      const SizedBox(width: 8.0), // Space between stars and rating number
                      Text(
                        _currentRating.toString(),
                        style: const TextStyle(
                          color: Colors.black, // Text color
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            // Product Name
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 6.0),
            // Menu Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedMenuIndex = 0),
                    child: MenuItem(
                      title: 'Product',
                      isSelected: _selectedMenuIndex == 0,
                    ),
                  ),
                ),
                          Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedMenuIndex = 1),
                    child: MenuItem(
                      title: 'Detail',
                      isSelected: _selectedMenuIndex == 1,
                    ),
                  ),
                ),
                       Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedMenuIndex = 2),
                    child: MenuItem(
                      title: 'Review',
                      isSelected: _selectedMenuIndex == 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            // Display content based on selected menu
            Expanded(
              child: IndexedStack(
                index: _selectedMenuIndex,
                children: [
                  // Content for "Product"
                  _productContent(),
                  // Content for "Detail"
                  _detailContent(),
                  // Content for "Review"
                  _reviewContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      
      // Action Buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _addToCart, // Add to Cart action
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.blue, // Border color
                      width: 1.5, // Border width
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 40), // Set width and height
                ),
                child: const Text('Add to Cart', style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 16.0), // Space between buttons
            Expanded(
              child: ElevatedButton(
                onPressed: _showBottomSheet, // Show bottom sheet when "Buy Now" is pressed
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Adjust corner radius
                  ),
                  minimumSize: const Size(double.infinity, 40), // Set width and height
                ),
                child: const Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _colorOption(Color color) {
    bool isSelected = color == _selectedColor; // Check if this color is selected
    return GestureDetector(
      onTap: () => _selectColor(color), // Update selected color
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: isSelected ? Icon(Icons.check, color: Colors.white) : null, // Show check mark if selected
      ),
    );
  }

  Widget _sizeOption(String size) {
    bool isSelected = size == _selectedSize; // Check if this size is selected
    return GestureDetector(
      onTap: () => _selectSize(size), // Update selected size
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300], // Blue background if selected
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
  



  Widget _buildDotIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.product.additionalImages.length + 1, // +1 for main image
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
    Widget _productContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Select Color:',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(height: 6.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _colorOption(Colors.black),
          const SizedBox(width: 8.0),
          _colorOption(Colors.red),
          const SizedBox(width: 8.0),
          _colorOption(Colors.blue),
        ],
      ),
      const SizedBox(height: 8.0),
      const Text(
        'Select Size:',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(height: 2.0),
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
      const SizedBox(height: 10.0),
      const Text(
        'Quantity:',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(height: 8.0),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementQuantity,
          ),
                          Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
         child:  Text(
            '$_quantity',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
                          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementQuantity,
          ),
        ],
      ),
    ],
  );
}


  Widget _detailContent() {
    // Replace with your content for the "Detail" tab
    return const Center(child: Text('Detailed description here'));
  }

  Widget _reviewContent() {
    // Replace with your content for the "Review" tab
    return const Center(child: Text('Reviews here'));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const MenuItem({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
     
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
} 


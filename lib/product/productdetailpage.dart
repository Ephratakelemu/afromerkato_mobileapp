import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:afromerkatoecommerce/product/Productcard.dart';
import 'package:afromerkatoecommerce/product/bottomsheet.dart'; 

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;
  String? _selectedSize;
  double _currentRating = 3.5; // Initialize with a default rating
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

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          quantity: _quantity,
          selectedSize: _selectedSize,
          onContinue: () {
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the entire body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns everything to the start (left)
          children: [
            // PageView for scrolling images one by one
            SizedBox(
              height: 350.0, // Height for the images
              child: PageView(
                controller: _pageController, // Attach the controller
                children: [
                  // Main Product Image
                  Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                  ),
                  // Additional Images
                  ...widget.product.additionalImages.map((image) {
                    return Image.asset(
                      image,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Custom Dot Indicator
            Center(
              child: _buildDotIndicator(),
            ),
            const SizedBox(height: 16.0),
            // Product price, Rating, and Rating Count
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
            const SizedBox(height: 10.0),
            // Select Color
            const Text(
              'Select Color:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
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
            const SizedBox(height: 10.0),
            // Select Size
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
                onPressed: () {
                  // Add to Cart action
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.blue, // Border color
                      width: 1.5, // Border width
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Set width and height
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
                    borderRadius: BorderRadius.circular(5), // Adjust radius here
                  ),
                  minimumSize: const Size(double.infinity, 50), // Set width and height
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
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.product.additionalImages.length + 1, // Number of dots
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}

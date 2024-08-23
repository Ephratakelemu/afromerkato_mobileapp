import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:afromerkatoecommerce/product/Productcard.dart';
import 'package:afromerkatoecommerce/product/bottomsheet.dart';
import 'package:afromerkatoecommerce/cart.dart'; 
import 'package:afromerkatoecommerce/cartpage.dart'; 
import 'package:afromerkatoecommerce/product/menu.dart';
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
  int _selectedMenuIndex = 0; 
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); 
    _pageController.addListener(_updatePageIndex);
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePageIndex); 
    _pageController.dispose();
    super.dispose();
  }

  void _updatePageIndex() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0; 
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
 
  Product productWithDetails = widget.product.copyWith(
    selectedColor: _selectedColor?.toString(),
    selectedSize: _selectedSize,
    quantity: _quantity,
  );

  Cart().addToCart(productWithDetails);

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
              SizedBox(
              height: 300.0, 
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
                        itemSize: 20.0, 
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0), 
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.blue, 
                        ),
                        unratedColor: Colors.grey[300], 
                        onRatingUpdate: (rating) {
                          setState(() {
                            _currentRating = rating; 
                          });
                        },
                      ),
                      const SizedBox(width: 8.0), 
                      Text(
                        _currentRating.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
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
      
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _addToCart, 
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.blue, 
                      width: 1.5, 
                    ),
                  ),
                  minimumSize: const Size(double.infinity, 40), // width and height
                ),
                child: const Text('Add to Cart', style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 16.0), 
            Expanded(
              child: ElevatedButton(
                onPressed: _showBottomSheet, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), 
                  ),
                  minimumSize: const Size(double.infinity, 40), //  width and height
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
    bool isSelected = color == _selectedColor; // Check selected color
    return GestureDetector(
      onTap: () => _selectColor(color), 
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: isSelected ? Icon(Icons.check, color: Colors.white) : null, 
      ),
    );
  }

  Widget _sizeOption(String size) {
    bool isSelected = size == _selectedSize; 
    return GestureDetector(
      onTap: () => _selectSize(size), 
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white, 
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
        widget.product.additionalImages.length + 1, 
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : const Color.fromARGB(255, 211, 210, 210),
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
   
    return const Center(child: Text('Detailed description here'));
  }
Widget _reviewContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    
      Expanded(
        child: ListView(
          children: [],
        ),
      ),
    
     
Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    width: 150, 
    margin: const EdgeInsets.all(16.0), 
    child: ElevatedButton(
      onPressed: () {
        _showWriteReviewBottomSheet(context); 
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), 
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.edit, color: Colors.white), 
          SizedBox(width: 8.0), 
          Text(
            'Write Review',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    ),
  ),
),

    ],
  );
}

void _showWriteReviewBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, 
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, //height of the bottom sheet
          children: [
            const Text(
              'What is your rate?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
           
           const SizedBox(height: 16.0), 
        RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.blue,
              ),
              unratedColor: const Color.fromARGB(255, 235, 224, 224),
              onRatingUpdate: (rating) {
               
              },
            ),
            const SizedBox(height: 16.0), 
            const Text(
              'Please share your opinion about the product.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0), 
            
           TextField(
  maxLines: 4,
  decoration: const InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0, 
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue, 
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue, // Blue color when the field is focused
        width: 2.0,
      ),
    ),
  ),
),

            const SizedBox(height: 16.0), 
           ElevatedButton(
      onPressed: () {
         
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), 
        ),
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
      ),
      child: const Text(
        'Send review',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
          ],
        ),
      );
    },
  );
}


}


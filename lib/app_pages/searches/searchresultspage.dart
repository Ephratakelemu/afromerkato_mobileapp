import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/app_pages/product/Productcard.dart';

class SearchResultsPage extends StatefulWidget {
  final String query;

  const SearchResultsPage({Key? key, required this.query}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late String _searchQuery;
  List<Product> allProducts = [
    Product(
      image: 'assets/images/watch 4.jpg',
      price: 25.00,
      name: 'smart watch',
      rating: 4.5,
      canceledPrice: 34, additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
      
    ),
    Product(
      image: 'assets/images/heelshoe 4.jpg',
      price: 19.99,
      name: 'Tnd shoes',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
      
    ),
    Product(
      image: 'assets/images/Men overcoat.jpg',
      price: 25.00,
      name: 'Men overcoat',
      rating: 4.5,
      canceledPrice: 34,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
    ),
    Product(
      image: 'assets/images/shoes 4.jpg',
      price: 19.99,
      name: 'Nike Air',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
    ),
    Product(
      image: 'assets/images/watch 2.jpg',
      price: 25.00,
      name: 'smart watch',
      rating: 4.5,
      canceledPrice: 34,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
    ),
    Product(
      image: 'assets/images/Framed glasses.jpg',
      price: 19.99,
      name: 'Framed glasses',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
    ),
    Product(
      image: 'assets/images/O-Neck tishert.jpg',
      price: 25.00,
      name: 'O-Neck tshirt ',
      rating: 4.5,
      canceledPrice: 34.50,
      additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchQuery = widget.query;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = allProducts.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchQuery = '';
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ProductCard(product: filteredProducts[index]);
        },
      ),
    );
  }
}

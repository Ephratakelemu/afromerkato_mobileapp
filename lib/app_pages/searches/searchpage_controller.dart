import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/product/productcard.dart';

class SearchPageController extends GetxController {
  var searchQuery = ''.obs;
  var filteredProducts = <Product>[].obs;

  List<Product> allProducts = [
    Product(
      image: 'assets/images/watch 4.jpg',
      price: 25.00,
      name: 'smart watch',
      rating: 4.5,
      canceledPrice: 34,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/heelshoe 4.jpg',
      price: 19.99,
      name: 'Tnd shoes',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/Men overcoat.jpg',
      price: 25.00,
      name: 'Men overcoat',
      rating: 4.5,
      canceledPrice: 34,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/shoes 4.jpg',
      price: 19.99,
      name: 'Nike Air',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/watch 2.jpg',
      price: 25.00,
      name: 'smart watch',
      rating: 4.5,
      canceledPrice: 34,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/Framed glasses.jpg',
      price: 19.99,
      name: 'Framed glasses',
      rating: 4,
      canceledPrice: 23,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
    Product(
      image: 'assets/images/O-Neck tishert.jpg',
      price: 25.00,
      name: 'O-Neck tshirt',
      rating: 4.5,
      canceledPrice: 34.50,
      additionalImages: [
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
        'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
        'assets/images/smart watch 2 Waterproof, Purple.jpg',
      ],
    ),
  ];
  

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterProducts();
  }

  void filterProducts() {
    filteredProducts.value = allProducts.where((product) {
      return product.name.toLowerCase().contains(searchQuery.value.toLowerCase());
    }).toList();
  }
}

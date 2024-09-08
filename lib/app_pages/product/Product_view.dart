
import 'package:afromerkatoecommerce/app_pages/cart/cart_controller.dart';
import 'package:afromerkatoecommerce/app_pages/productdetailpage/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../cart/cart_view.dart';
import 'product_controller.dart';

class Product {
  final String image;
  final String name;
  final double price;
  final double rating;
  final double? canceledPrice;
  final List<String> additionalImages;
  final String? selectedColor;
  final String? selectedSize;
  int quantity;
  bool isFavorited;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.canceledPrice,
    required this.additionalImages,
    this.selectedColor,
    this.selectedSize,
    this.quantity = 1,
    this.isFavorited = false, 
  });

  Product copyWith({
    String? selectedColor,
    String? selectedSize,
    int? quantity,
    bool? isFavorited,
  }) {
    return Product(
      name: name,
      image: image,
      additionalImages: additionalImages,
      price: price,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
      quantity: quantity ?? this.quantity,
      canceledPrice: canceledPrice,
      rating: rating,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }
}

class ProductCardView extends GetView<ProductController> {
  final Product product;
final int index;
  const ProductCardView({Key?key, required this.index, required this.product}):super(key:key);

@override
  Widget build(BuildContext context) {
    final ProductController productController= Get.put(ProductController());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    right: 2.0,
                    top: 2.0,
                    child: IconButton(
                      icon: Icon(
                       product. isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: Colors.blue,
                      ),
                      onPressed: () 
                        {
                        productController.toggleFavorite(index);
                        }
                        ),
                       ),
                        ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (product.canceledPrice != null)
                    Text(
                      '\$${product.canceledPrice!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
           Container(
  padding: const EdgeInsets.all(4),
  width: MediaQuery.of(context).size.width,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          product.name,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      const SizedBox(width: 8.0), 
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                RatingBar.builder(
                  initialRating: product.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 1,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.white, 
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(width: 4.0),
                Text(
                  '${product.rating.toStringAsFixed(1)}', //rated number
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),

      Container(
              padding: const EdgeInsets.all(2.0),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Get.find<Cartcontroller>().addToCart(product.copyWith());
    Get.to(() => CartView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 128, 219),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget{
  final List <Product> products;
  const ProductList({Key? key, required this.products}):super (key:key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Productlist'),
      ),
body:  GridView.builder(
   padding: const EdgeInsets.all(2),
      shrinkWrap: true,  

  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount
(crossAxisCount: 2,
crossAxisSpacing: 10,
mainAxisSpacing: 10,
childAspectRatio: 0.65,),
itemCount: products.length,
itemBuilder: (context,index){
  return ProductCardView(product: products[index], index: index,);
       },
      ),
    );
  }
}
  
  
 

import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/product/productlist.dart';
import 'package:afromerkatoecommerce/product/productdetailpage.dart';


class Product {
  final String image;
  final String name;
  final double price;
  final double rating;
    final double? canceledPrice;


  Product({
    required this.image,
    required this.name,
    required this.price,
   required this.rating,
   required this.canceledPrice,
   
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
              Padding(
            padding: const EdgeInsets.all(2.0),
            child: RatingBar.builder(
              initialRating: product.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 1,
              itemSize: 10.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.blue,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
         Container(
            padding: const EdgeInsets.all(4),
           width: MediaQuery.of(context).size.width,
           child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  Text(
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
                      decoration: TextDecoration.lineThrough, decorationColor: Colors.blue,
                    ),
                  ),
                const SizedBox(width: 8),
              
              ],
            ),
          ),
              
             
    Container(
            padding: const EdgeInsets.all(2.0),
            width:MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 17, 128, 219),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Add to Cart',style:TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
      )
    );
  }
}

class RatingBar {
  static builder({required double initialRating, required int minRating, required Axis direction, required bool allowHalfRating, required int itemCount, required double itemSize, required Icon Function(dynamic context, dynamic _) itemBuilder, required Null Function(dynamic rating) onRatingUpdate}) {}
}


  
  class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Exclusive deals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductList(products: products),
                    ),
                  );
                },
                child: const Text(
                  'View All',style: TextStyle(color: Colors.black),
                  
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 260,
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200, // Adjust the width of each item as needed
                margin: const EdgeInsets.only(right: 10.0),
                child: ProductCard(product: products[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
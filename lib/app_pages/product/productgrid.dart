import 'package:flutter/material.dart';
import 'Productcard.dart';
import 'productlist.dart';

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
                  'View All',
                  style: TextStyle(color: Colors.black),
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
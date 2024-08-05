import 'package:afromerkatoecommerce/Productcard.dart';
import 'package:flutter/material.dart';

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
  return ProductCard(product: products[index]);
       },
      ),
    );
  }
}
  
  
 

import 'package:afromerkatoecommerce/app_pages/homescreen/herosection.dart';
import 'package:afromerkatoecommerce/app_pages/product/Productcard.dart';
import 'package:afromerkatoecommerce/app_pages/category/catagorysection.dart';
import 'package:afromerkatoecommerce/app_pages/homescreen/Search.dart';
import 'package:afromerkatoecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/app_pages/homescreen/searchresultspage.dart';




class HomePage extends StatefulWidget{
  const HomePage({super.key});

   @override
  
  
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onSearchSubmitted() {
    // Navigate to the SearchResultsPage with the query
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(query: _searchQuery),
      ),
    );
  }

   @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('welcome to afromerkato'),
        actions: const [Icon(Icons.notifications),
        ],
        ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
             Search(onSearchChanged: _onSearchChanged,onSearchSubmitted: _onSearchSubmitted,),
            
              SizedBox(
                 width:MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,)
                     ),
             Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
              width:MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text('New arrival',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),),
               
              ],),
            ),
              
                     // Other sections of your page can go here
            Herosection(),
            // Include the CategorySection widget
             
         
             ProductGrid(
          products: [
            Product(
              image: 'assets/images/watch 4.jpg',
              price: 25.00,
              name: 'smart watch',
              rating: 4.5,
              canceledPrice: 34,
               additionalImages: [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
            ),
            Product(
              image: 'assets/images/heelshoe 4.jpg',
              price: 19.99,
              name: 'Tnd shoes',
              rating: 4,
              canceledPrice: 23, 
              additionalImages: [ 'assets/images/Heels 8 Strappy Evening Heels.jpg',
    'assets/images/Heels 3 Classic High Heels.jpg',
    'assets/images/Heels 4 Black Strappy Heels.jpg',],
            ),
             Product(
              image: 'assets/images/Men overcoat.jpg',
              price: 25.00,
              name: 'Men overcoat',
              rating: 4.5,
              canceledPrice: 34,
              additionalImages:
               [ 'assets/images/coat 5 Winter Coat.jpg',
   'assets/images/coat 4.jpg ',
    'assets/images/coat 1.jpg',],
            ),
            Product(
              image: 'assets/images/shoes 4.jpg',
              price: 19.99,
              name: 'tnd shoes',
              rating: 4,
              canceledPrice: 23,
             additionalImages: [ 'assets/images/Heels 8 Strappy Evening Heels.jpg',
    'assets/images/Heels 3 Classic High Heels.jpg',
    'assets/images/Heels 4 Black Strappy Heels.jpg',],
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
              additionalImages: 
              [ 'assets/images/makeup 3 Huda Beauty Nude Palette.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/makeup 3 Huda Beauty Nude Palette.jpg',],
            ),
             Product(
              image: 'assets/images/O-Neck tishert.jpg',
              price: 25.00,
              name: 'O-Neck tshirt ',
              rating: 4.5,
              canceledPrice: 34.50,
              additionalImages:
               [ 'assets/images/smart watch 2 Waterproof, Purple.jpg',
    'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg',
    'assets/images/smart watch 2 Waterproof, Purple.jpg',],
            ),
            ]),

            
        CategorySection(),
        
          ]
          

            // Other sections of your page can go 
        ),
      ),
       );
      }
}



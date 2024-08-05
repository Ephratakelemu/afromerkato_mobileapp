

import 'package:afromerkatoecommerce/Herosection.dart';
import 'package:afromerkatoecommerce/Productcard.dart';
import 'package:afromerkatoecommerce/catagorysection.dart';
import 'package:afromerkatoecommerce/homescreen/Search.dart';
import 'package:afromerkatoecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/homescreen/searchresultspage.dart';



class HomePage extends StatefulWidget{
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
            ),
            Product(
              image: 'assets/images/heelshoe 4.jpg',
              price: 19.99,
              name: 'Tnd shoes',
              rating: 4,
              canceledPrice: 23,
            ),
             Product(
              image: 'assets/images/Men overcoat.jpg',
              price: 25.00,
              name: 'Men overcoat',
              rating: 4.5,
              canceledPrice: 34,
            ),
            Product(
              image: 'assets/images/shoes 4.jpg',
              price: 19.99,
              name: 'tnd shoes',
              rating: 4,
              canceledPrice: 23,
            ),
             Product(
              image: 'assets/images/watch 2.jpg',
              price: 25.00,
              name: 'smart watch',
              rating: 4.5,
              canceledPrice: 34,
            ),
            Product(
              image: 'assets/images/Framed glasses.jpg',
              price: 19.99,
              name: 'Framed glasses',
              rating: 4,
              canceledPrice: 23,
            ),
             Product(
              image: 'assets/images/O-Neck tishert.jpg',
              price: 25.00,
              name: 'O-Neck tshirt ',
              rating: 4.5,
              canceledPrice: 34.50,
            ),
            ]),

            
        CategorySection()
          

            // Other sections of your page can go here
          ],
        ),
      ),
       );
      }
}



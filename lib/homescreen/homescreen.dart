
import 'package:afromerkatoecommerce/Herosection.dart';
import 'package:afromerkatoecommerce/Productcard.dart';
import 'package:afromerkatoecommerce/catagorysection.dart';
import 'package:afromerkatoecommerce/homescreen/Body.dart';
import 'package:afromerkatoecommerce/main.dart';
import 'package:flutter/material.dart';

class HomePage extends MyApp {

  @override 
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title:const Text('welcome to afromerkato'),
        ),
        
         body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Body(),
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
              image: '/assets/images/watch 4.jpg',
              price: 25.00,
              name: 'smart watch',
              rating: 4.5,
            ),
            Product(
              image: 'assets/images/heelshoe 4.jpg',
              price: 19.99,
              name: 'Tnd shoes',
              rating: 4,
            ),]),
       
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                margin: const EdgeInsets.only(left:10,right: 15),
              width:MediaQuery.of(context).size.width,
             
  
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Category',style:  TextStyle(fontSize: 18),),
                Text('View all',style:  TextStyle(fontSize: 18),),
              ],),
            ),
            CategorySection(),
            

            // Other sections of your page can go here
          ],
        ),
      ),
       );
      }
}

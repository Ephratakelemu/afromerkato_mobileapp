import 'package:afromerkatoecommerce/app_pages/product/Productcard.dart';
import 'package:afromerkatoecommerce/app_pages/category/categorysection.dart';
import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/app_pages/searches/searchresultspage.dart';
import 'package:get/get.dart';
import 'package:afromerkatoecommerce/app_pages/product/productlist.dart';

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
    Get.to(()=> SearchResultsPage(query: _searchQuery),
      );
    
  }

   @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text('welcome to afromerkato',style: TextStyle(fontSize:23),),
        scrolledUnderElevation: 0,
        actions: const [Icon(Icons.notifications),
        ],
          bottom: PreferredSize(
  preferredSize: const Size.fromHeight(50.0), // Adjust the height to fit the TextField
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0), // Adjust the radius for rounded corners
      child: TextField(
        autofocus: false,
        decoration: const InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.white, // Optional: To ensure the background is visible
          filled: true,
        ),
        onChanged: _onSearchChanged,
        onSubmitted: (query) {
          _onSearchSubmitted();
        },
      ),
    ),
  ),
),

      ),
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
           Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
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




class Herosection extends StatefulWidget {
  @override
  _HerosectionState createState() => _HerosectionState();
}

class _HerosectionState extends State<Herosection> {
  final PageController _pageController = PageController(); // Page controller
  int _currentPage = 0; // To track the current page

  final List<Map<String, String>> heroItems = [
    {
      'image': 'assets/images/shoes 1.jpg',
      'Text': 'Super Flash Sale\n50% Off',
      
    },
    {
      'image': 'assets/images/sport 4 Bottom Sneakers.jpg',
      'Text': 'Super Flash Sale\n50% Off',
      
    },
    {
      'image': 'assets/images/shoes 3.jpg',
      'Text': 'Super Flash Sale\n50% Off',
      
    },
    {
      'image': 'assets/images/shoes 4.jpg',
      'Text': 'Super Flash Sale\n50% Off',
      
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 230,
          padding: const EdgeInsets.all(1),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index; // Update the current page index
              });
            },
            itemCount: heroItems.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 400,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        heroItems[index]['image']!,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 24,
                      child: Text(
                        heroItems[index]['Text']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  
                    Positioned(
                      left: 25,
                      bottom: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle See More button press
                          print('See More pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Custom Page Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(heroItems.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 10.0 : 8.0, // Wider if selected
              height: 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : const Color.fromARGB(255, 190, 188, 188),
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }
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


import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/category/Allcategories.dart'; 

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Category> categories = [
    Category(
      name: 'Apparel',
      icon: Icons.checkroom_sharp,
      subcategories: [
        SubCategory(name: 'Sweaters'),
        SubCategory(name: 'T-shirts'),
        SubCategory(name: 'Pants'),
        SubCategory(name: 'Hoodies'),
        SubCategory(name: 'Dresses'),
        SubCategory(name: 'Coats'),
         SubCategory(name: 'Office Wear'),
          SubCategory(name: 'Jeans'),
          
      ],
    ),
    Category(name: 'Watches', icon: Icons.watch,
         subcategories: [
        SubCategory(name: 'Smart Watches'),
        SubCategory(name: 'Luxury Watches '),
          SubCategory(name: 'Sport Watches'),
      
      ],),

    Category(name: 'Shoes', icon: Icons.hiking_sharp,
    subcategories: [
        SubCategory(name: 'Casual Shoes'),
          SubCategory(name: 'Sneakers Shoes'),
        SubCategory(name: 'Sport Shoes'),
        SubCategory(name: 'Boots'),
        SubCategory(name: 'Heels'),
              ],),


    Category(name: 'Beauty', icon: Icons.girl_rounded,
    subcategories: [
        SubCategory(name: 'Skin care'),
        SubCategory(name: 'Make Up'),
        SubCategory(name: 'Hair Care'),
        SubCategory(name: 'Fragrances'),
              ],
    ),
    Category(name: 'Electronics', icon: Icons.mobile_friendly,
     subcategories: [
        SubCategory(name: 'Laptops'),
        SubCategory(name: 'Television'),
        SubCategory(name: 'Audio Devices'),
        
       
              
              ],
    ),
    Category(name: 'Toys', icon: Icons.toys,
     subcategories: [
        SubCategory(name: 'Infant Toys'),
        SubCategory(name: 'Games and Puzzles'),
        SubCategory(name: 'Arts and Crafts'),
       
         
              ],
    ),
    Category(name: 'Sports', icon: Icons.sports_basketball,
    subcategories: [
      SubCategory(name: 'Football'),
      SubCategory(name: 'Basketball'),
      SubCategory(name: 'Tennis'),
       SubCategory(name: 'Cycling'),]
      
    ),
  ];

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
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllCategoriesPage(categories: categories),
                    ),
                  );
                },
                child: const Text('View All', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            itemCount: categories.length < 3 ? categories.length : 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Handle category tap
                  print('Tapped on ${categories[index].name}');
                },
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        categories[index].icon,
                        size: 30,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 24, 23, 23)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:afromerkatoecommerce/Allcategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Category> categories = [
    Category(name: 'Apparel', icon: Icons.checkroom, subcategories: [
      SubCategory(name: 'Men\'s Wear', image: 'assets/images/Men overcoat.jpg'),
      SubCategory(name: 'Women\'s Wear', image: 'assets/images/shoes 2.jpg'),
    ]),
    Category(name: 'Watches', icon: Icons.watch, subcategories: [
      SubCategory(name: 'Men\'s Watches', image: 'assets/images/watch 4.jpg'),
      SubCategory(name: 'Women\'s Watches', image: 'assets/images/watch 2.jpg'),
    ]),
    Category(name: 'Shoes', icon: Icons.hiking_sharp),
    Category(name: 'Beauty', icon: Icons.girl_rounded),
    Category(name: 'Electronics', icon: Icons.mobile_friendly),
    Category(name: 'Toys', icon: Icons.toys),
    Category(name: 'Sports', icon: Icons.sports_basketball),
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
                child: const Text('View All',style: TextStyle(color: Colors.blue),)
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true, // Use this to make the GridView take only the needed space
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling in this section
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.0, // Adjust this value for different aspect ratios
            ),
            itemCount: 3, // Show only the first row (3 items)
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
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 16),
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

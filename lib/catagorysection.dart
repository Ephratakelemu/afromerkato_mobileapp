import 'package:flutter/material.dart';

class Categorysection extends StatelessWidget {
  Categorysection({super.key});

  final List<Category> categories = [
    Category(name: 'Apparel', icon: Icons.checkroom),
    Category(name: 'Watches', icon: Icons.watch),
    Category(name: 'Shoes', icon: Icons.directions_walk),
    Category(name: 'Beauty', icon:Icons.girl),
    Category(name: 'Toys', icon: Icons.toys),
    Category(name: 'Electronics', icon: Icons.tv),
    Category(name: 'Device', icon: Icons.devices),
    Category(name: 'sports', icon: Icons.sports_basketball),
    
  ];

 
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle category tap
              print('Tapped on ${categories[index].name}');
            },
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    categories[index].icon,
                    size: 50,
                    color: Colors.blue,
                  ),
                const  SizedBox(height: 10),
                  Text(
                    categories[index].name,
                    textAlign: TextAlign.end,
                    style:const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}
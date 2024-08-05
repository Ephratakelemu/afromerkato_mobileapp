import 'package:flutter/material.dart';


class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final List<Category> categories = [
    Category(name: 'Apparel', icon: Icons.checkroom),
    Category(name: 'Watches', icon: Icons.watch),
    Category(name: 'Shoes', icon: Icons.directions_walk),
    Category(name: 'Beauty', icon: Icons.girl),
    Category(name: 'Toys', icon: Icons.toys),
    Category(name: 'Electronics', icon: Icons.tv),
    Category(name: 'Device', icon: Icons.devices),
    Category(name: 'Sports', icon: Icons.sports_basketball),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

         Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(left: 10, right: 15),
      width: MediaQuery.of(context).size.width,
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
                child: const Text('View All'),
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
                        size: 50,
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


class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}
  class AllCategoriesPage extends StatelessWidget {
  final List<Category> categories;

  const AllCategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
   body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
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
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: ListTile(
                  leading: Icon(
                    categories[index].icon,
                    size: 50,
                    color: Colors.blue,
                  ),
                  title: Text(
                    categories[index].name,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

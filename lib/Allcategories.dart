import 'package:flutter/material.dart';

class AllCategoriesPage extends StatefulWidget {
  final List<Category> categories;

  const AllCategoriesPage({Key? key, required this.categories}) : super(key: key);

  @override
  _AllCategoriesPageState createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  Category? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Row(
        children: [
          // Category List
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
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
                          category.icon,
                          size: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Subcategory List
          Expanded(
            flex: 2,
            child: _selectedCategory == null
                ? Center(child: Text('Select a category'))
                : ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: _selectedCategory!.subcategories.map((subCategory) {
                      return ListTile(
                        leading: Image.asset(
                          subCategory.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(subCategory.name),
                        onTap: () {
                          // Handle subcategory tap
                          print('Tapped on ${subCategory.name}');
                        },
                      );
                    }).toList(),
                  ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final List<SubCategory> subcategories;

  Category({
    required this.name,
    required this.icon,
    this.subcategories = const [],
  });
}

class SubCategory {
  final String image;
  final String name;

  SubCategory({
    required this.image,
    required this.name,
  });
}

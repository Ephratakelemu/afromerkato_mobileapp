
import 'package:flutter/material.dart';
 


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
        padding: const EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryItem(categories[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return ExpansionTile(
      leading: Icon(
        category.icon,
        size: 50,
        color: Colors.blue,
      ),
      title: Text(
        category.name,
        style: const TextStyle(fontSize: 16),
      ),
      children: category.subcategories.map((subCategory) {
        return _buildSubCategoryItem(subCategory);
      }).toList(),
    );
  }

  Widget _buildSubCategoryItem(SubCategory subCategory) {
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



        

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
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                  child:InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Card(
                    
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          category.icon,
                          size: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(height:20),
                        Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                );
              },
            ),
          ),
          // Subcategory List
          Expanded(
            flex: 2,
            child: _selectedCategory == null
                ? Center(child: Text('Select a category'))
                : Row(
                    children: [
                      // Women section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Women',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.all(8.0),
                                children: _selectedCategory!.subcategories
                                    .where((sc) => sc.name.contains('Women'))
                                    .map((subCategory) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          subCategory.image,
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          subCategory.name,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Men section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Men',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.all(8.0),
                                children: _selectedCategory!.subcategories
                                    .where((sc) => sc.name.contains('Men'))
                                    .map((subCategory) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          subCategory.image,
                                          width: double.infinity,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          subCategory.name,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

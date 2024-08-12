import 'package:flutter/material.dart';

import 'package:afromerkatoecommerce/product/Productcard.dart';
import 'package:afromerkatoecommerce/product/productdetailpage.dart';

class AllCategoriesPage extends StatefulWidget {
  final List<Category> categories;

  const AllCategoriesPage({super.key, required this.categories});

  @override
  // ignore: library_private_types_in_public_api
  _AllCategoriesPageState createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  final Map<String, List<Map<String, String>>> itemsData = {
    'Sweaters': [
      {'product': 'assets/images/Homme sweaters 6.jpg', 'name':'Sweater 1'},
      {'product': 'assets/images/Sunday Sweater 11.jpg', 'name':'Men Sweater'},
      {'product': 'assets/images/Vintage genser sweater.jpg', 'name':'solf sweeter'},
      {'product': 'assets/images/Sleeve Sweater 8.jpg', 'name':'Sleeve Sweater'},
      {'product': 'assets/images/Oversized Sweater.jpg', 'name':'Retro Sweater '},
      {'product': 'assets/images/Pullover Men Sweater.jpg', 'name':'Men Sweater'},
      {'product': 'assets/images/sweater 1 handmade.jpg', 'name':'Men sweater'},
    ],
    'T-shirts': [
      {'product': 'assets/images/O-Neck tishert.jpg', 'name': 'Sweater 1'},
      {'product': 'assets/images/T-Shirt Design.jpg', 'name': 'T-shirt'},
      {'product':'assets/images/T-shirt Smile Chest.jpg', 'name':'T-shirt smile'},
      {'product':'assets/images/Cotton Smile T-shirt.jpg', 'name':'Cotton T-shirt '},
      {'product':'assets/images/Crew Neck T-shirts.jpg', 'name':'T-shirt'},
      {'product': 'assets/images/emotion T Shirt 2.jpg', 'name':'Emotion T-shirt'},
      {'product': 'assets/images/Sleeve TShirts - Pink.jpg', 'name':'Sleeve T-shirt'},
     
      
    ],
   
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Row(
        children: [
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
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                        _selectedSubCategory = null;
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
   const SizedBox(height: 20),
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
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: _selectedCategory == null
                ? const Center(child: Text('Select a category'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _selectedCategory!.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(8.0),
                          children: _selectedCategory!.subcategories.map((subCategory) {
                            final isSelected = _selectedSubCategory == subCategory;
                            return Theme(
                              data: ThemeData(
                                dividerColor: Colors.transparent, // Hide the default divider
                              ),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8.0),
                                child: ExpansionTile(
                                  title: Row(
                                    children: [
                                      Expanded(child: Text(subCategory.name)),
                                      Container(
                                        width: 30,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected ? Colors.blue : const Color.fromARGB(255, 211, 210, 210),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            isSelected ? Icons.expand_less : Icons.expand_more,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: const SizedBox.shrink(), 
                                  onExpansionChanged: (isExpanded) {
                                    setState(() {
                                      _selectedSubCategory = isExpanded ? subCategory : null;
                                    });
                                  },
                                  children: [
                                    if (_selectedSubCategory == subCategory)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 400,
                                          child: GridView.builder(
                                            padding: const EdgeInsets.all(8.0),
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 8.0,
                                              childAspectRatio: 0.6,
                                            ),
                                            itemCount: itemsData[subCategory.name]?.length ?? 0,
                                            itemBuilder: (context, index) {
                                              final item = itemsData[subCategory.name]![index];
                                               return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => ProductDetailPage(
                                                           product: Product(
                                                        name: item['name']!,
                                                       image: item['product']!,
                                                         price: 100.0,
                                                          rating: 4,
                                                  canceledPrice: 76,
                
            ),
                                                      ),
                                                    ),
                                                  );
                                                
                                            },
                                               child:  GridTile(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      item['product']!, 
                                                      fit: BoxFit.cover,
                                                      height: 125,
                                                      width: double.infinity,
                                                    ),
                                                    const SizedBox(height: 8.0),
                                                    Text(item['name']!),
                                                  ],
                                                ),
                                              ),
                                               );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
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
  final String name;

  SubCategory({
    required this.name,
  });
}

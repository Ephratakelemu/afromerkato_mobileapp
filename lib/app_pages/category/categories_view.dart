import 'package:afromerkatoecommerce/app_pages/category/category_controller.dart';
import 'package:afromerkatoecommerce/app_pages/category/model.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:afromerkatoecommerce/app_pages/productdetailpage/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllCategoriesPageView extends GetView<AllCategoriesController> {
  final List<Category> categories;

  const AllCategoriesPageView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllCategoriesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: Row(
        children: [
          // Left side: Category List
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Obx(() {
                  final isSelected = controller.selectedCategory.value == category;
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () => controller.selectCategory(category),
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
                                color: isSelected
                                    ? Colors.blue
                                    : const Color.fromARGB(255, 32, 31, 31),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),

          // Right side: Subcategory List and Items Grid
          Expanded(
            flex: 2,
            child: Obx(() {
              final selectedCategory = controller.selectedCategory.value;
              if (selectedCategory == null) {
                return const Center(child: Text('Select a category'));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedCategory.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8.0),
                      children: selectedCategory.subcategories.map((subCategory) {
                        return Obx(() {
                          final isSelectedSubCategory = controller.selectedSubCategory.value == subCategory;
                          return Theme(
                            data: ThemeData(
                              dividerColor: Colors.transparent,
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
                                        color: isSelectedSubCategory
                                            ? Colors.blue
                                            : const Color.fromARGB(255, 211, 210, 210),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          isSelectedSubCategory ? Icons.expand_less : Icons.expand_more,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: const SizedBox.shrink(),
                                onExpansionChanged: (isExpanded) {
                                  if (isExpanded) {
                                    controller.selectSubCategory(subCategory);
                                  } else {
                                    controller.selectedSubCategory.value = null;
                                  }
                                },
                                children: [
                                  if (isSelectedSubCategory)
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
                                          itemCount: controller.itemsData[subCategory.name]?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            final item = controller.itemsData[subCategory.name]![index];
                                            return GestureDetector(
                                              onTap: () {
                                                // Navigate to product detail page
                                                Get.to(() => ProductDetailPage(
                                                  product: Product(
                                                    name: item['name']!,
                                                    image: item['product']!,
                                                    price: 100.0,
                                                    rating: 4,
                                                    canceledPrice: 76,
                                                    additionalImages: [],
                                                   
                                                  ),
                                                ));
                                              },
                                              child: GridTile(
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
                        });
                      }).toList(),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

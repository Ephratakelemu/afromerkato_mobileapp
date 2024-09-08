import 'package:afromerkatoecommerce/app_pages/cart/cart_controller.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:afromerkatoecommerce/app_pages/product/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:afromerkatoecommerce/app_pages/productdetailpage/detail_controller.dart';
import '../cart/cart_view.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     // Initialize the controller and pass the product
    final ProductDetailController controller = Get.put(ProductDetailController(product: product));

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.0,
              child: PageView(
                controller: controller.pageController,
                children: [
                  Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                  ...product.additionalImages.map((image) {
                    return Image.asset(
                      image,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Obx(() => _buildDotIndicator(controller)),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                _buildRatingBar(controller),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 6.0),
            // Menu Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildMenuItem(controller, 'Product', 0),
                _buildMenuItem(controller, 'Detail', 1),
                _buildMenuItem(controller, 'Review', 2),
              ],
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.selectedMenuIndex.value,
                  children: [
                    _productContent(controller),
                    _detailContent(),
                    _reviewContent(controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed:() {
                  Get.find<Cartcontroller>().addToCart(product.copyWith(
      selectedColor:controller.selectedColor.value?.toString(),
      selectedSize:controller.selectedSize.value,
      quantity:controller.quantity.value,
    ));
    Get.to(() => CartView());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Add to Cart', style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: ElevatedButton(
                onPressed: controller.showBottomSheet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator(ProductDetailController controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        controller.product.additionalImages.length + 1,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.currentPage.value == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(ProductDetailController controller, String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectedMenuIndex.value = index,
        child: Obx(() => MenuItem(
          title: title,
          isSelected: controller.selectedMenuIndex.value == index,
        )),
      ),
    );
  }

  Widget _buildRatingBar(ProductDetailController controller) {
    return Row(
      children: [
        Obx(
          () => RatingBar.builder(
            initialRating: controller.currentRating.value,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20.0,
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.blue),
            onRatingUpdate: (rating) => controller.currentRating.value = rating,
          ),
        ),
        const SizedBox(width: 8.0),
        Obx(() => Text(controller.currentRating.value.toString())),
      ],
    );
  }

  Widget _productContent(ProductDetailController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Color:', style: TextStyle(fontSize: 18.0)),
        const SizedBox(height: 6.0),
        Row(
          children: [
            _colorOption(controller, Colors.black),
            const SizedBox(width: 8.0),
            _colorOption(controller, Colors.red),
            const SizedBox(width: 8.0),
            _colorOption(controller, Colors.blue),
          ],
        ),
        const SizedBox(height: 8.0),
        const Text('Select Size:', style: TextStyle(fontSize: 18.0)),
        const SizedBox(height: 2.0),
        Row(
          children: [
            _sizeOption(controller, '4'),
            const SizedBox(width: 8.0),
            _sizeOption(controller, '4.5'),
            const SizedBox(width: 8.0),
            _sizeOption(controller, '5'),
            const SizedBox(width: 8.0),
            _sizeOption(controller, '6.5'),
          ],
        ),
        const SizedBox(height: 10.0),
        const Text('Quantity:', style: TextStyle(fontSize: 18.0)),
        const SizedBox(height: 8.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: controller.decrementQuantity,
            ),
            Obx( 
              
              () => Container(
                 padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: Text(
                controller.quantity.value.toString(),
                style: const TextStyle(fontSize: 18.0),
              ),),),
            
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: controller.incrementQuantity,
            ),
          ],
        ),
      ],
    );
  }

  Widget _colorOption(ProductDetailController controller, Color color) {
    return GestureDetector(
      onTap: () => controller.selectColor(color),
      child: Obx(
        () => Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: controller.selectedColor.value == color ? Colors.white : const Color.fromARGB(255, 192, 191, 191),
              width: 3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizeOption(ProductDetailController controller, String size) {
    return GestureDetector(
      onTap: () => controller.selectSize(size),
      child: Obx(
        () => Container(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color:  controller.selectedSize.value == size ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 16.0,
            color: controller.selectedSize.value == size ? Colors.white : Colors.black,
          ),
        ),
        ),
      ),
    );
  }

  Widget _detailContent() {
    return const Text("Product Details");
  }

    Widget _reviewContent(ProductDetailController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: ListView(
          children: [], // Add review items here
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 150,
          margin: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              _showWriteReviewBottomSheet(Get.context!); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.edit, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Write Review',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

void _showWriteReviewBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            const Text(
              'What is your rate?',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.blue,
              ),
              unratedColor: const Color.fromARGB(255, 235, 224, 224),
              onRatingUpdate: (rating) {
              
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Please share your opinion about the product.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            TextField(
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
              child: const Text(
                'Send Review',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  }


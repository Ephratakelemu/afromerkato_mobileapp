
import 'package:afromerkatoecommerce/app_pages/productdetailpage/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:afromerkatoecommerce/app_pages/product/Product_view.dart';
import 'package:get/get.dart';
import 'category_controller.dart';
import 'package:afromerkatoecommerce/app_pages/category/model.dart';

class CategoriesView extends GetView<CategoryController> {
  final List<Category> categories;
  final CategoryController categoryController = Get.put(CategoryController());
 
CategoriesView({super.key, required this.categories,});

  final Map<String, List<Map<String, String>>> itemsData = {
    'Sweaters': [
      {'product': 'assets/images/Homme sweaters 6.jpg', 'name':'Sweater 1'},
      {'product': 'assets/images/Sunday Sweater 11.jpg', 'name':'Men Sweater'},
      {'product': 'assets/images/Vintage genser sweater.jpg', 'name':'solf sweeter'},
     
    ],
    'T-shirts': [
      {'product': 'assets/images/O-Neck tishert.jpg', 'name': 'Sweater 1'},
      {'product': 'assets/images/T-Shirt Design.jpg', 'name': 'T-shirt'},
      {'product':'assets/images/T-shirt Smile Chest.jpg', 'name':'T-shirt smile'},
     
     ],
     'Pants':[
      {'product':'assets/images/Pant 1 Trousers.jpg','name':'Trouser pants'},
      {'product':'assets/images/Pant 2 Cargo Trousers.jpg','name':'Cargo pants'},
      {'product':'assets/images/Pant 3 Running Jogging.jpg','name':'Running pants'},
      {'product':'assets/images/Pant 4 Cargo Pants.jpg','name':'Cargo pants '}, 
     ],
     'Hoodies':[
      {'product':'assets/images/Hoodie 1 Pocket Drawstring.jpg', 'name':'Pocket Hoodie'},
      {'product':'assets/images/Hoodie 2 Sweatshirt.jpg', 'name':'Sweatshirt Hoodie'},
      {'product':'assets/images/Hoodie 3 Cropped Hoodie.jpg', 'name':'Cropped Hoodie'},
      ],
      'Dresses':[
        {'product':'assets/images/dress 1 Chiffon Dress - Red.jpg','name':'Chiffon Dress'},
        {'product':'assets/images/dress 2 Gothic Punk Short Dress.jpg','name':'Short Dress'},
        {'product':'assets/images/dress 3 High Waist  Dress - Pink.jpg','name':'HighWaist Dress'},
      ],
      'Coats':[
        {'product':'assets/images/coat 1.jpg','name':'Coat'},
        {'product':'assets/images/coat 2 Belted Woolen Coat.jpg','name':'Belted Woolen Coat'},
        {'product':'assets/images/coat 3.jpg','name':'Coat'},
       
      ],
      'Office Wear':[
        {'product':'assets/images/office wear 1 suits.jpg','name':'Suit Office Wear'},
        {'product':'assets/images/office wear 2.jpg','name':'Office Wear'},
        {'product':'assets/images/office wear 3 premium shirt.jpg','name':'Office Wear Premium shirt'},
        {'product':'assets/images/office wear 4 casual suit pants.jpg','name':'Office Wear'},
       
      ],
      'Jeans':[
        {'product':'assets/images/Jeans 1 Cargo Jeans.jpg','name':'Cargo Jeans'},
        {'product':'assets/images/Jeans 2 Cargo Jeans.jpg','name':'Cargo Jeans'},
        {'product':'assets/images/Jeans 3 Fashion.jpg','name':'Jeans Fashion'},   
      ],
        'Smart Watches':[
        {'product':'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg','name':'Bluetooth Smart Watch Men'},
        {'product':'assets/images/smart watch 2 Waterproof, Purple.jpg','name':' Waterproof Purple'},
        {'product':'assets/images/smart watch 3 Call Smart Watches.jpg','name':'Call Smart Watches'},
        
       
      ],
           'Luxury Watches':[
        {'product':'assets/images/luxury watch 1 Men Luminous Chronograph.jpg','name':'Men luxury watch '},
        {'product':'assets/images/luxury watch 2 Calendar Quartz Watch.jpg','name':'Calendar Quartz Watch'},
        {'product':'assets/images/luxury watch 3.jpg','name':'luxury watch'},
        {'product':'assets/images/luxury watch 4 Wrist Watch Casual Classic.jpg','name':' Wrist Watch Classic'},  
      ],
           'Sport Watches':[
        {'product':'assets/images/sport watch 1 Sports Modes Waterproof.jpg','name':'Waterproof watches'},
        {'product':'assets/images/sport watch2  Bluetooth Sports Heart Rate.jpg','name':'Bluetooth Sports Heart Rate'},
        {'product':'assets/images/sport watch 3.jpg','name':'Sport watch'},  
      ],
             'Casual Shoes':[
        {'product':'assets/images/casual 1 Leather Boot.jpg','name':'Leather Boot Shoes'},
        {'product':'assets/images/casual 2 Women Classic Canvas.jpg','name':' Women Classic Canvas'},
        {'product':'assets/images/casual 3 Sneakers for Women.jpg','name':'Sneakers for Women'},
        {'product':'assets/images/casual 4 Flats Shoes For Women.jpg','name':'Flat Shoes For Women'},
      {'product':'assets/images/casual 18 Nike Shoes _ Nike Air Jordan.jpg','name':'Nike Air Jordan'},
        
       ],
    'Sneakers Shoes':[
        {'product':'assets/images/sneakers 1 Women Sneakers.jpg','name':'Women Sneakers'},
        {'product':'assets/images/sneakers 2.jpg','name':'Sneakers'},
        {'product':'assets/images/Sneakers 3 for Women.jpg','name':'Women Sneakers'},
        {'product':'assets/images/sneakers 4  Men Sneaker.jpg','name':'Men Sneaker'}, 
      ],
      'Sport Shoes':[
        {'product':'assets/images/sport 1 Mens Running Shoes.jpg','name':'Mens Running Shoes'},
        {'product':'assets/images/sport 2.jpg','name':'Sport Shoes'},
        {'product':'assets/images/sport 3 Men Mesh Running Sneakers.jpg','name':'Men Running Sneakers'},
        {'product':'assets/images/sport 4 Bottom Sneakers.jpg','name':'Bottom Sneakers'},  
      ],
  'Boots':[
        {'product':'assets/images/bootes 1 Bottes.jpg','name':'Bottes'},
        {'product':'assets/images/bootes 2  Girls.jpg','name':' Girls Bootes'},
        {'product':'assets/images/bootes 3 Boots High Heels.jpg','name':'Bootes High Heels'},
        {'product':'assets/images/bootes 4 Men Zipper Boots.jpg','name':'Men Zipper Bootes'},
       
      ],
    'Heels':[
        {'product':'assets/images/Heels 1 High Heels Sandal.jpg','name':'High Heels Sandal'},
        {'product':'assets/images/Heels 2 Shallow Mouth.jpg','name':'Shallow Mouth Heels'},
        {'product':'assets/images/Heels 3 Classic High Heels.jpg','name':'Classic High Heels'},
        {'product':'assets/images/Heels 4 Black Strappy Heels.jpg','name':'Black Strappy Heels'},  
      ],

          'Skin care':[
        {'product':'assets/images/Skin Care 1 Products.jpg','name':'Skin Care'},
        {'product':'assets/images/Skin Care 2 Fourth Ray Beauty.jpg','name':'Fourth Ray Beauty'},
        {'product':'assets/images/Skin Care 3 Vegamour.jpg','name':'Vegamour'},
       
        
      ],
          'Make Up':[
        {'product':'assets/images/makeup 1 Mehron Makeup.jpg','name':'Mehron Makeup'},
        {'product':'assets/images/makeup 2 liquid pen eyeliners.jpg','name':'liquid pen eyeliners'},
        {'product':'assets/images/makeup 3 Huda Beauty Nude Palette.jpg','name':'Huda Beauty Nude '},
        {'product':'afromerkatoecommerce/assets/images/makeup 4.jpg','name':'Makeup'}, ],
          
          'Hair Care':[
        {'product':'assets/images/haircare 1 Hair Brush Set with Sleep Bonnet.jpg','name':'Hair Brush '},
        {'product':'assets/images/haircare 2 Head & Shoulders.jpg','name':'Head & Shoulders'},
        {'product':'assets/images/haircare 3 Intensive Repair.jpg','name':'Intensive Repair'},
        {'product':'assets/images/haircare 4 Diffuse Curly Hair.jpg','name':'Diffuse Curly Hair'},
       
      ],
          'Fragrances':[
        {'product':'assets/images/fragrances 1.jpg','name':'fragrances'},
        {'product':'assets/images/fragrances 2  WOAHSTYLE.jpg','name':'WOAHSTYLE'},
        {'product':'assets/images/fragrances 3 Miss Dior Perfume.jpg','name':'Miss Dior Perfume'},
        {'product':'assets/images/fragrances 4 Brand & Sealed Valentino.jpg','name':'Brand & Sealed Valentin'},
        
      ],
          'Laptops':[
        {'product':'assets/images/laptop 1 Luxury laptop.jpg','name':'Luxury laptop'},
        {'product':'assets/images/laptop 2.jpg','name':'Laptop'},
        {'product':'assets/images/laptop 3 MacBook Pro.jpg','name':' Mac Book Pro'},
       
      ],
          'Television':[
        {'product':'assets/images/tv 1LG 32 inch HD  LED Smart TV.jpg','name':'LED Smart TV'},
        {'product':'assets/images/tv 2 Samsung Neo QLED Smart TV.jpg','name':'Samsung Smart TV'},
        {'product':'assets/images/tv 3 Samsung  QLED  HDR Smart TV.jpg','name':' HDR Smart TV'},
       
      ],
          'Audio Devices':[
        {'product':'assets/images/audio device 1 Bluetooth Headphones.jpg','name':'Bluetooth Headphones'},
        {'product':'assets/images/audio device 2 A2+ Home Music System w_ Bluetooth.jpg','name':'A2+ Bluetooth'},
        {'product':'assets/images/audio device 3 Audioengine A2 Plus Wireless Bluetooth Desktop Speakers.jpg','name':' A2+ Bluetooth Speakers'},
        {'product':'assets/images/audio device 5 SonyHeadphone.jpg','name':'Sony Headphone'},
        
      ],
          'Infant Toys':[
        {'product':'assets/images/infant toys 1 Fruits Like Strawberries And Avocados.jpg','name':'Fruits Like Strawberries'},
        {'product':'assets/images/infant toys 2 Big Teddy Bear for Baby.jpg','name':'Big Teddy Bear'},
        {'product':'assets/images/infant toys 3 Disney World Dining Tips.jpg','name':'Disney World Dining Tip'},
        {'product':'assets/images/infant toys 4 Rainbow Cabin _ Kawaii Products.jpg','name':'Rainbow Cabin'},
      
      ],
          'Games and Puzzles':[
        {'product':'assets/images/games and... 1 developmental toys.jpg','name':'developmental toys'},
        {'product':'assets/images/games and... 2 NINE CUBE Kids Camera.jpg','name':'NINE CUBE Kids Camera'},
        {'product':'assets/images/games and... 3.jpg','name':'Games'},
        {'product':'assets/images/games and... 4  Kindi Kids.jpg','name':'Kindi Kids'},
         
      ],
          'Arts and Crafts':[
        {'product':'assets/images/arts and crafts 1 RECYCLE BABY FOOD JARS.jpg','name':' RECYCLE BABY FOOD JARS'},
        {'product':'assets/images/arts and crafts 2 DIY Decorating Ideas.jpg','name':'DIY Decorating Ideas'},
        {'product':'assets/images/arts and crafts 3.jpg','name':'arts and crafts'},
          
      ],
          'Football':[
        {'product':'assets/images/football 1 guantes.jpg','name':'Football Guantes'},
        {'product':'assets/images/football 2 Soccer Ball for Kid.jpg','name':'Soccer Ball for Kid'},
        {'product':'assets/images/football 3 Men  Hight-Cut Soccer Shoes.jpg','name':'Hight-Cut Soccer Shoes'},
          
      ],
          'Basketball':[
        {'product':'assets/images/Basketball 1 Backpack.jpg','name':'Basketball Backpack'},
        {'product':'assets/images/baskeball 2 Molten Sports Division.jpg','name':'Basketball-Molten Sports'},
        {'product':'assets/images/Basketball 3 Ball.jpg','name':'Basketball'},
       ],
          'Tennis':[
        {'product':'assets/images/tennis 1 Versatile & Durable Bag for Tennis.jpg','name':'Durable Bag for Tennis'},
        {'product':'assets/images/tennis 2 Tenis HEAD Speed.jpg','name':'Tenis HEAD Speed'},
        {'product':'assets/images/tennis 3 Children Tennis Racket.jpg','name':'Children Tennis Racket'},
       ],
          'Cycling':[
        {'product':'assets/images/cycling 1 BELSIZE Belt Drive cycle.jpg','name':'BELSIZE Belt Drive cycle'},
        {'product':'assets/images/cycling 2 Warm Waterproof Cycling Gloves.jpg','name':'Waterproof Cycling Gloves'},
        {'product':'assets/images/cycling 3.jpg','name':'cycle'}, ],

   
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('All Categories', style: TextStyle(fontSize: 27),),
        leading: IconButton(onPressed: () {Get.back();} ,icon:const Icon(Icons.arrow_back_ios) ,),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = categoryController.selectedCategory.value == category;
                return Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: () {
                      categoryController.setSelectedCategory(category);
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
                              color: isSelected ? Colors.blue : Color.fromARGB(255, 32, 31, 31),
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
            child: Obx(() {
              final selectedCategory = categoryController.selectedCategory.value;
              final selectedSubCategory = categoryController.selectedSubCategory.value;
              return selectedCategory == null
                  ? const Center(child: Text('Select a category'))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedCategory.name,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(8.0),
                            children: selectedCategory.subcategories.map((subCategory) {
                              final isSelected = selectedSubCategory == subCategory;
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
                                      categoryController.setSelectedSubCategory(isExpanded ? subCategory : null);
                                    },
                                    children: [
                                      if (isSelected)
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
                                              itemCount: categoryController.getItemsForSubCategory(subCategory.name).length,
                                              itemBuilder: (context, index) {
                                                final item = categoryController.getItemsForSubCategory(subCategory.name)[index];
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
                                                            additionalImages: [],
                                                          ),
                                                        ),
                                                      ),
                                                    );
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

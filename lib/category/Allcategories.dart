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
      {'product': 'assets/images/sweater 1 handmade.jpg', 'name':'Sweater'},
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
     'Pants':[
      {'product':'assets/images/Pant 1 Trousers.jpg','name':'Trouser pants'},
      {'product':'assets/images/Pant 2 Cargo Trousers.jpg','name':'Cargo pants'},
      {'product':'assets/images/Pant 3 Running Jogging.jpg','name':'Running pants'},
      {'product':'assets/images/Pant 4 Cargo Pants.jpg','name':'Cargo pants '},
      {'product':'assets/images/Pant 5 OrcaJump.jpg','name':'OrcaJump pants'},
      {'product':'assets/images/pant 6 Wide-Legged Pants.jpg','name':'Wide-Legged pants'},
      {'product':'assets/images/Pant 7black waist.jpg','name':'Black waist pants'},
     ],
     'Hoodies':[
      {'product':'assets/images/Hoodie 1 Pocket Drawstring.jpg', 'name':'Pocket Hoodie'},
      {'product':'assets/images/Hoodie 2 Sweatshirt.jpg', 'name':'Sweatshirt Hoodie'},
      {'product':'assets/images/Hoodie 3 Cropped Hoodie.jpg', 'name':'Cropped Hoodie'},
      {'product':'assets/images/Hoodie 4 Japanese Dragon.jpg', 'name':'Japanese Dragon Hoodie'},
      {'product':'assets/images/Hoodie 5 Butterfly.jpg', 'name':'Butterfly Hoodie'},
      {'product':'assets/images/Hoodie 6 Pullover.jpg', 'name':'Pullover Hoodie'},
      {'product':'assets/images/Hoodie 7.jpg', 'name':'Hoodie'},
      {'product':'assets/images/Hoodie 8 Pocket.jpg', 'name':'Pocket Hoodie'},
      ],
      'Dresses':[
        {'product':'assets/images/dress 1 Chiffon Dress - Red.jpg','name':'Chiffon Dress'},
        {'product':'assets/images/dress 2 Gothic Punk Short Dress.jpg','name':'Short Dress'},
        {'product':'assets/images/dress 3 High Waist  Dress - Pink.jpg','name':'HighWaist Dress'},
        {'product':'assets/images/dress 4 short dress.jpg','name':'Short Dress'},
        {'product':'assets/images/dress 5 square dress 2.jpg','name':'Square Dress'},
        {'product':'assets/images/dress 6 square dress.jpg','name':'Square Dress'},
         

      ],
      'Coats':[
        {'product':'assets/images/coat 1.jpg','name':'Coat'},
        {'product':'assets/images/coat 2 Belted Woolen Coat.jpg','name':'Belted Woolen Coat'},
        {'product':'assets/images/coat 3.jpg','name':'Coat'},
        {'product':'assets/images/coat 4.jpg','name':'Coat'},
        {'product':'assets/images/coat 5 Winter Coat.jpg','name':'Winter Coat'},
        {'product':'assets/images/coat 6 gray.jpg','name':'Gry Coat'},
        {'product':'assets/images/coat 7 Workwear Coats.jpg','name':'Workwear Coats'},
      ],
      'Office Wear':[
        {'product':'assets/images/office wear 1 suits.jpg','name':'Suit Office Wear'},
        {'product':'assets/images/office wear 2.jpg','name':'Office Wear'},
        {'product':'assets/images/office wear 3 premium shirt.jpg','name':'Office Wear Premium shirt'},
        {'product':'assets/images/office wear 4 casual suit pants.jpg','name':'Office Wear'},
        {'product':'assets/images/office wear 6.jpg','name':'Office Wear'},
        {'product':'assets/images/office wear 5 Suits Jacket.jpg','name':'Office Wear Suit jacket'},
        {'product':'assets/images/office wear 7 Light Gray.jpg','name':'Office Wear Light grey'},
        {'product':'assets/images/office wear 8.jpg','name':'Office Wear'},
        {'product':'assets/images/office wear 9 Elegant Dresses.jpg','name':'Office Wear Dress'},
        {'product':'assets/images/office wear 10 Lapel Red Suit.jpg','name':'Office Wear Red suit'},
      ],
      'Jeans':[
        {'product':'assets/images/Jeans 1 Cargo Jeans.jpg','name':'Cargo Jeans'},
        {'product':'assets/images/Jeans 2 Cargo Jeans.jpg','name':'Cargo Jeans'},
        {'product':'assets/images/Jeans 3 Fashion.jpg','name':'Jeans Fashion'},
        {'product':'assets/images/jeans 4 Cargo Jeans.jpg','name':' Cargo Jeans'},
        {'product':'assets/images/Jeans 5 High Waist Jeans.jpg','name':'High Waist Jeans'},
        {'product':'assets/images/Jeans 6 Denim Black.jpg','name':'Black Jeans'},
        {'product':'assets/images/Jeans 7 Baggy low-rise  jeans.jpg','name':'Baggy jeans'},
        {'product':'assets/images/jeans 8.jpg','name':'Jeans'},
        
      ],
        'Smart Watches':[
        {'product':'assets/images/smart watch 1 Bluetooth Smart Watch for IOS Android Men.jpg','name':'Bluetooth Smart Watch Men'},
        {'product':'assets/images/smart watch 2 Waterproof, Purple.jpg','name':' Waterproof Purple'},
        {'product':'assets/images/smart watch 3 Call Smart Watches.jpg','name':'Call Smart Watches'},
        {'product':'assets/images/Smart Watch 4 iPhone.jpg','name':'Smart Watch iPhone'},
        {'product':'assets/images/Smart Watches 5 for Android iOS.jpg','name':'Android iOS'},
        {'product':'assets/images/smart watch 6 Quartz Watch.jpg','name':'Quartz Smart Watch'},
        {'product':'assets/images/smart watch 7  Waterproof Sleep Tracker.jpg','name':'Waterproof Sleep Tracker'},
        {'product':'assets/images/smart watch 8 Ladies For Android IOS+BOX.jpg','name':'Android IOS+BOX'},
        {'product':'assets/images/smart watch 9 SANDA Luxury Smart Watch.jpg','name':'SANDA Luxury Smart Watch'},
      ],
           'Luxury Watches':[
        {'product':'assets/images/luxury watch 1 Men Luminous Chronograph.jpg','name':'Men luxury watch '},
        {'product':'assets/images/luxury watch 2 Calendar Quartz Watch.jpg','name':'Calendar Quartz Watch'},
        {'product':'assets/images/luxury watch 3.jpg','name':'luxury watch'},
        {'product':'assets/images/luxury watch 4 Wrist Watch Casual Classic.jpg','name':' Wrist Watch Classic'},
        {'product':'assets/images/luxury watch 5 Diamond Dial Male Wrist Watches.jpg','name':'Male Wrist Watches'},
        {'product':'assets/images/luxury watch 6 Men_ Quality and Style.jpg','name':'Men_ Quality luxury watch'},
        {'product':'assets/images/luxury watch 7 Quartz Watch &  Bracelet.jpg','name':' Quartz Watch &  Bracelet'},
        {'product':'assets/images/luxury watch 8  Women Bracelet Watch.jpg','name':'Women Bracelet Watch'},
        {'product':'assets/images/luxury watch 9 Bangles Jewelry Free Gift Box.jpg','name':'Luxury watch'},
        {'product':'assets/images/luxury watch 10 Analog Wristwatch.jpg','name':'Analog Wristwatch'},
        {'product':'assets/images/luxury watch 11 Black Butterfly Watch.jpg','name':'Black Butterfly Watch'},
        {'product':'assets/images/luxury watch 12 Crystal Rose Gold.jpg','name':'Crystal Rose Gold Watch'},
        {'product':'assets/images/luxury watch 13 Waterproof Ladie.jpg','name':' Waterproof Ladie Watch'},
        
      ],
           'Sport Watches':[
        {'product':'assets/images/sport watch 1 Sports Modes Waterproof.jpg','name':'Waterproof watches'},
        {'product':'assets/images/sport watch2  Bluetooth Sports Heart Rate.jpg','name':'Bluetooth Sports Heart Rate'},
        {'product':'assets/images/sport watch 3.jpg','name':'Sport watch'},
        {'product':'assets/images/sport watch 4.jpg','name':'Sport watch'},
        {'product':'assets/images/sport watch 5 Silica Gel Sports Watch.jpg','name':'Silica Gel Sports Watch'},
      
        
      ],
             'Casual Shoes':[
        {'product':'assets/images/casual 1 Leather Boot.jpg','name':'Leather Boot Shoes'},
        {'product':'assets/images/casual 2 Women Classic Canvas.jpg','name':' Women Classic Canvas'},
        {'product':'assets/images/casual 3 Sneakers for Women.jpg','name':'Sneakers for Women'},
        {'product':'assets/images/casual 4 Flats Shoes For Women.jpg','name':'Flat Shoes For Women'},
        {'product':'assets/images/casual 5 Women Autumn Casual Fashion.jpg','name':'Casual Fashion'},
        {'product':'assets/images/casual 6 Women Soft Leather.jpg','name':'Soft Leather shoes'},
        {'product':'assets/images/casual 7 Women Flat Retro Leather.jpg','name':'Flat Retro Leather'},
        {'product':'assets/images/casual 8 Claus Trainer Sneaker.jpg','name':'Claus Trainer Sneaker'},
        {'product':'assets/images/casual 9 Casual Shoes Men.jpg','name':'Casual Shoes Men'},
        
        {'product':'assets/images/casual 18 Nike Shoes _ Nike Air Jordan.jpg','name':'Nike Air Jordan'},
        {'product':'assets/images/casual 16 Brand New Nike Air Force.jpg','name':'Brand New Nike Air Force'},
        {'product':'assets/images/casual 14 Toe Flats.jpg','name':'Toe Flats'},
       {'product':'assets/images/casual 15 Wedge Shoes, Elegant Brown.jpg','name':'Wedge Shoes'},
        {'product':'assets/images/casual 17 Air Max  Trainers_ Nike.jpg','name':'Casual Trainers_ Nike'},
       {'product':'assets/images/casual 13 Flats Pink Black.jpg','name':'Flats Pink Black'},
        {'product':'assets/images/casual 12 Rebellious Rose Shoes.jpg','name':' Rebellious Rose Shoes'},
        {'product':'assets/images/casual 11 Comfy Sports Casual Shoes.jpg','name':'Comfy Sports Casual Shoes'},
        
      ],
    'Sneakers Shoes':[
        {'product':'assets/images/sneakers 1 Women Sneakers.jpg','name':'Women Sneakers'},
        {'product':'assets/images/sneakers 2.jpg','name':'Sneakers'},
        {'product':'assets/images/Sneakers 3 for Women.jpg','name':'Women Sneakers'},
        {'product':'assets/images/sneakers 4  Men Sneaker.jpg','name':'Men Sneaker'},
        {'product':'assets/images/sneakers 5.jpg','name':'Sneakers'},
        {'product':'assets/images/sneakers 6.jpg','name':'Sneakers'},
        {'product':'assets/images/sneakers 7 Men Casual Sneakers.jpg','name':'Men Casual Sneakers'},
        {'product':'assets/images/sneakers 8 Nike Joyride Sneakers.jpg','name':'Nike Joyride Sneakers'},
         {'product':'assets/images/sneakers 9.jpg','name':'Sneakers'},
        
      ],
      'Sport Shoes':[
        {'product':'assets/images/sport 1 Mens Running Shoes.jpg','name':'Mens Running Shoes'},
        {'product':'assets/images/sport 2.jpg','name':'Sport Shoes'},
        {'product':'assets/images/sport 3 Men Mesh Running Sneakers.jpg','name':'Men Running Sneakers'},
        {'product':'assets/images/sport 4 Bottom Sneakers.jpg','name':'Bottom Sneakers'},
        {'product':'assets/images/sport 5 Light Weight Sport Sneakers.jpg','name':' Sport Sneakers'},
        {'product':'assets/images/sport 6 Nike Air Max.jpg','name':'Nike Air Max'},
        {'product':'assets/images/sport 7 Sports Training Sneakers.jpg','name':'Sports Training Sneakers'},
        {'product':'assets/images/sport 8.jpg','name':'Sport Shoes'},
        {'product':'assets/images/sport 9 Women Running Shoes.jpg','name':'Women Running Shoes'},
        {'product':'assets/images/sport 10 Nike Sportswear AIR MAX 270.jpg','name':'Nike Sportswear AIR MAX'},
        {'product':'assets/images/sport 11 NEW Air Max Nike 270s.jpg','name':'Max Nike 270s'},
        {'product':'assets/images/sport 12 Nike Air Max 270 Women Shoes.jpg','name':'Women Shoes'},
       {'product':'assets/images/sport 13 Nike AIR MAX 270.jpg','name':'Nike AIR MAX 270'},
        
      ],
  'Boots':[
        {'product':'assets/images/bootes 1 Bottes.jpg','name':'Bottes'},
        {'product':'assets/images/bootes 2  Girls.jpg','name':' Girls Bootes'},
        {'product':'assets/images/bootes 3 Boots High Heels.jpg','name':'Bootes High Heels'},
        {'product':'assets/images/bootes 4 Men Zipper Boots.jpg','name':'Men Zipper Bootes'},
        {'product':'assets/images/bootes 5.jpg','name':'New Bootse'},
        {'product':'assets/images/bootes 6.jpg','name':'New Bootes'},
        {'product':'assets/images/bootes 7 Black Chelsea Boots.jpg','name':'Black Chelsea Bootes'},
        {'product':'assets/images/bootes 8 Martin Boots.jpg','name':'Martin Bootes'},
        {'product':'assets/images/bootes 9.jpg','name':'New Bootes'},
        {'product':'assets/images/bootes 10 Chapala Black Western Ankle Boots.jpg','name':'Western Ankle Bootes'},
        {'product':'assets/images/bootes 11.jpg','name':'New Bootes'},
        
      ],
    'Heels':[
        {'product':'assets/images/Heels 1 High Heels Sandal.jpg','name':'High Heels Sandal'},
        {'product':'assets/images/Heels 2 Shallow Mouth.jpg','name':'Shallow Mouth Heels'},
        {'product':'assets/images/Heels 3 Classic High Heels.jpg','name':'Classic High Heels'},
        {'product':'assets/images/Heels 4 Black Strappy Heels.jpg','name':'Black Strappy Heels'},
        {'product':'assets/images/Heels 5 Ankle Strap Sandals.jpg','name':' Strap Sandals'},
        {'product':'assets/images/Heels 6 Dinner Bound Heels.jpg','name':'Dinner Bound Heels'},
        {'product':'assets/images/Heels 7 High Heels Casual.jpg','name':'High Heels Casual'},
        {'product':'assets/images/Heels 8 Strappy Evening Heels.jpg','name':'Evening Heels'},
        {'product':'assets/images/Heels 9 Apricot Pointy Heels.jpg','name':'Pointy Heels'},
        {'product':'assets/images/Heels 10.jpg','name':'Heels'},
        {'product':'assets/images/Heels 11.jpg','name':'Heels'},
        {'product':'assets/images/Heels 12.jpg','name':'Heels'},
        
      ],

          'Skin care':[
        {'product':'assets/images/Skin Care 1 Products.jpg','name':'Skin Care'},
        {'product':'assets/images/Skin Care 2 Fourth Ray Beauty.jpg','name':'Fourth Ray Beauty'},
        {'product':'assets/images/Skin Care 3 Vegamour.jpg','name':'Vegamour'},
        {'product':'assets/images/Skin Care 4 For Dull & Uneven Toned Skin.jpg','name':'Dull & Uneven Toned Skin'},
        
        
      ],
          'Make Up':[
        {'product':'assets/images/makeup 1 Mehron Makeup.jpg','name':'Mehron Makeup'},
        {'product':'assets/images/makeup 2 liquid pen eyeliners.jpg','name':'liquid pen eyeliners'},
        {'product':'assets/images/makeup 3 Huda Beauty Nude Palette.jpg','name':'Huda Beauty Nude '},
        {'product':'afromerkatoecommerce/assets/images/makeup 4.jpg','name':'Makeup'},
        {'product':'assets/images/makeup 5.jpg','name':'Makeup'},
        {'product':'assets/images/makeup 6 Anastasia Beverly Hills.jpg','name':'Anastasia Beverly Hills'},
        {'product':'assets/images/makeup 7 MAC Foundation.jpg','name':'MAC Foundation'},
        {'product':'afromerkatoecommerce/assets/images/makeup 8 Grail makeup.jpg','name':'Grail Makeup'},
        {'product':'assets/images/makeup 9 Naughty Nude Lip Combo.jpg','name':'Nude Lip Combo'},
        {'product':'assets/images/makeup 10 Black Cherry Lip Combo.jpgg','name':'Black Cherry Lip Combo'},
        
      ],
          'Hair Care':[
        {'product':'assets/images/haircare 1 Hair Brush Set with Sleep Bonnet.jpg','name':'Hair Brush '},
        {'product':'assets/images/haircare 2 Head & Shoulders.jpg','name':'Head & Shoulders'},
        {'product':'assets/images/haircare 3 Intensive Repair.jpg','name':'Intensive Repair'},
        {'product':'assets/images/haircare 4 Diffuse Curly Hair.jpg','name':'Diffuse Curly Hair'},
        {'product':'assets/images/haircare 5 Thin Hair.jpg','name':'Thin Hair'},
        {'product':'assets/images/haircare 6 Curls, and Lock in Moisture.jpg','name':'Curls'},
        {'product':'assets/images/haircare 7 Silk Hair Ties.jpg','name':'Silk Hair Ties'},
        {'product':'assets/images/haircare 8 Unbrushes 💗.jpg','name':'Unbrushes 💗'},
         {'product':'assets/images/haircare 9 Beauty fans.jpg','name':'Beauty fans'},
        {'product':'assets/images/haircare 10 coconut milk range 🥥🤍🫶🏼.jpg','name':'coconut milk range 🥥🤍'},
         {'product':'assets/images/haircare 11 Suave MenShampoo + Conditioner.jpg','name':'MenShampoo + Conditioner'},
        {'product':'assets/images/haircare 12 Head and Shoulders Men Refresh.jpg','name':'Men Refresh'},
      ],
          'Fragrances':[
        {'product':'assets/images/fragrances 1.jpg','name':'fragrances'},
        {'product':'assets/images/fragrances 2  WOAHSTYLE.jpg','name':'WOAHSTYLE'},
        {'product':'assets/images/fragrances 3 Miss Dior Perfume.jpg','name':'Miss Dior Perfume'},
        {'product':'assets/images/fragrances 4 Brand & Sealed Valentino.jpg','name':'Brand & Sealed Valentin'},
        {'product':'assets/images/fragrances 5 Fragrances For Men 2024.jpg','name':'Fragrances For Men'},
        {'product':'assets/images/fragrances 6 Good Girl Eau de Parfum.jpg','name':'Good Girl Eau de Parfum'},
        {'product':'assets/images/fragrances 7 Victoria Secret vanella.jpg','name':'Victoria Secret'},
        {'product':'assets/images/fragrances 8 Chanel Coco Parfum.jpg','name':'Channel Coco Parfum'},
        {'product':'assets/images/fragrances 9 man parfumes.jpg','name':'Man parfumes'},
        {'product':'assets/images/fragrances 10 PURE XS.jpg','name':'PURE XS'},
        
      ],
          'Laptops':[
        {'product':'assets/images/laptop 1 Luxury laptop.jpg','name':'Luxury laptop'},
        {'product':'assets/images/laptop 2.jpg','name':'Laptop'},
        {'product':'assets/images/laptop 3 MacBook Pro.jpg','name':' Mac Book Pro'},
        {'product':'assets/images/laptop 4.jpg','name':'Laptop'},
        {'product':'assets/images/laptop 5 iPod.jpg','name':'Laptop'},
        {'product':'assets/images/laptop 6 HP Stream 14_ HD.jpg','name':'HP Stream 14_ HD'},
        {'product':'assets/images/laptop 7 Best Lenovo laptops.jpg','name':'Best Lenovo laptops'},
        {'product':'assets/images/laptop 8 HP Mini  Netbook.jpg','name':'HP Mini  Netbook'},
        
      ],
          'Television':[
        {'product':'assets/images/tv 1LG 32 inch HD  LED Smart TV.jpg','name':'LED Smart TV'},
        {'product':'assets/images/tv 2 Samsung Neo QLED Smart TV.jpg','name':'Samsung Smart TV'},
        {'product':'assets/images/tv 3 Samsung  QLED  HDR Smart TV.jpg','name':' HDR Smart TV'},
        {'product':'assets/images/tv 4 TV Remote Control for Samsung.jpg','name':'Remote Control Samsung'},
        {'product':'assets/images/tv 5 HIGH DEFINITION TELEVISION.jpg','name':' High Definition TV'},
        {'product':'assets/images/tv 6 Samsung 43-Inch Full HD Smart LED TV.jpg','name':'Samsung 43-Inch smart TV'},
        {'product':'assets/images/tv 7 Samsung Inch Smart HDR 8K Ultra HD QLED Television.jpg','name':'Samsung Smart Tv'},
        {'product':'assets/images/tv 8 4K Ultra HD 1080P  TV multifuncional Set Top Box.jpg','name':'4K Ultra HD 1080P  TV'},
        
      ],
          'Audio Devices':[
        {'product':'assets/images/audio device 1 Bluetooth Headphones.jpg','name':'Bluetooth Headphones'},
        {'product':'assets/images/audio device 2 A2+ Home Music System w_ Bluetooth.jpg','name':'A2+ Bluetooth'},
        {'product':'assets/images/audio device 3 Audioengine A2 Plus Wireless Bluetooth Desktop Speakers.jpg','name':' A2+ Bluetooth Speakers'},
        {'product':'assets/images/audio device 5 SonyHeadphone.jpg','name':'Sony Headphone'},
        {'product':'assets/images/audio device 4 Apple AirPod Max.jpg','name':'Apple AirPod Max'},
        {'product':'assets/images/audio device 6 Computer Speakers.jpg','name':' Computer Speakers'},
        {'product':'assets/images/audio device 7 Beats Studio3 Wireless Headphones.jpg','name':'Headphones'},
         {'product':'assets/images/audio device 8 Hazzler Earbuds.jpg','name':'Hazzler Earbuds'},
        {'product':'assets/images/audio device 9 Bluetooth Wireless Headphones - Navy.jpg','name':'Folding Headphonesadphones'},
        {'product':'assets/images/audio device 10 Bluetooth Wireless Folding Headphones.jpg','name':''},
        {'product':'assets/images/audio device 12Marshall Motif II ANC.jpg','name':'Marshall MotifII ANC'},
        {'product':'assets/images/audio device 11.jpg','name':'Audio device'},
      
        
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
        {'product':'assets/images/games and... 5.jpg','name':'Puzzles'},
        {'product':'assets/images/games and... 6 Jigsaw Puzzles.jpg','name':'Jigsaw Puzzles'},
        {'product':'assets/images/games and... 7 Candy Crush Saga.jpg','name':' Candy Crush'},
        {'product':'assets/images/games and... 8 Wooden Sorting & Stacking Toys.jpg','name':'Wooden Stacking Toys'},
         {'product':'assets/images/games and... 9 Rubiks cube.jpg','name':'Rubiks cube'},
        
      ],
          'Arts and Crafts':[
        {'product':'assets/images/arts and crafts 1 RECYCLE BABY FOOD JARS.jpg','name':' RECYCLE BABY FOOD JARS'},
        {'product':'assets/images/arts and crafts 2 DIY Decorating Ideas.jpg','name':'DIY Decorating Ideas'},
        {'product':'assets/images/arts and crafts 3.jpg','name':'arts and crafts'},
        {'product':'assets/images/arts and crafts 4 Resin Custom Notebook.jpg','name':'Resin Custom Notebook'},
        {'product':'assets/images/arts and crafts 5 Neon Color Gel Pens.jpg','name':'Neon Color Gel Pens'},
        {'product':'assets/images/arts and crafts 6.jpg','name':'Arts and Crafts'},
        {'product':'assets/images/arts and crafts 7 Pre-order Chess Set.jpg','name':'Pre-order Chess Set'},
        
        
      ],
          'Football':[
        {'product':'assets/images/football 1 guantes.jpg','name':'Football Guantes'},
        {'product':'assets/images/football 2 Soccer Ball for Kid.jpg','name':'Soccer Ball for Kid'},
        {'product':'assets/images/football 3 Men  Hight-Cut Soccer Shoes.jpg','name':'Hight-Cut Soccer Shoes'},
        {'product':'assets/images/football 4 ball.jpg','name':'FootBall'},
        {'product':'assets/images/football 5 Nike Air Zoom Mercurial Vapor.jpg','name':'Nike Air Zoom'},
        {'product':'assets/images/football 6 Nouveaux Ensemble Survetement Foot Milan.jpg','name':'Foot Milan'},
        {'product':'assets/images/football 7 Nike England Blackout Jersey shirt.jpg','name':'Jersey shirt football'},
        {'product':'assets/images/football 8.jpg','name':'FootBall'},
         {'product':'assets/images/football 9.jpg','name':'FootBall'},
        
      ],
          'Basketball':[
        {'product':'assets/images/Basketball 1 Backpack.jpg','name':'Basketball Backpack'},
        {'product':'assets/images/baskeball 2 Molten Sports Division.jpg','name':'Basketball-Molten Sports'},
        {'product':'assets/images/Basketball 3 Ball.jpg','name':'Basketball'},
        {'product':'assets/images/Basketball 4 jordan Sport Fans Silicone Wristbands.jpg','name':'Basketball jordan Wristbands'},
        {'product':'assets/images/baskeball 5 Basketball Bag - green.jpg','name':'Basketball Bag'},
        {'product':'assets/images/baskeball 6 Perfect sports equipment.jpg','name':'Basketball equipments'},
        {'product':'assets/images/baskeball 7 Jordan Legacy Mens Basketball.jpg','name':'Jordan Mens Basketbal'},
        
        
      ],
          'Tennis':[
        {'product':'assets/images/tennis 1 Versatile & Durable Bag for Tennis.jpg','name':'Durable Bag for Tennis'},
        {'product':'assets/images/tennis 2 Tenis HEAD Speed.jpg','name':'Tenis HEAD Speed'},
        {'product':'assets/images/tennis 3 Children Tennis Racket.jpg','name':'Children Tennis Racket'},
        {'product':'assets/images/tennis 4 GOTH PET TENNIS BALLS.jpg','name':'PET TENNIS BALLS'},
        {'product':'assets/images/tennis 5.jpg','name':'Tennis'},
        {'product':'assets/images/tennis 6 Tennis Shoes White.jpg','name':'Tennis Shoes White'},
        {'product':'assets/images/tennis 7 Table Tennis Class Pack (Smooth Bat).jpg','name':'Table Tennis Class Pack'},
        
        
      ],
          'Cycling':[
        {'product':'assets/images/cycling 1 BELSIZE Belt Drive cycle.jpg','name':'BELSIZE Belt Drive cycle'},
        {'product':'assets/images/cycling 2 Warm Waterproof Cycling Gloves.jpg','name':'Waterproof Cycling Gloves'},
        {'product':'assets/images/cycling 3.jpg','name':'cycle'},
        {'product':'assets/images/cycling 4  Waterproof  Mountaineering Bicycle Backpack.jpg','name':' Bicycle Backpack'},
        {'product':'assets/images/cycling 5 Warm Waterproof Cycling Gloves.jpg','name':'Waterproof Cycling Gloves'},
        {'product':'assets/images/cycling 6 Custom Santa Cruz Bronson.jpg','name':'cycling Santa Cruz Bronson'},
        {'product':'assets/images/cycling 7 Adults Road  Cycling Shoes.jpg','name':'Road Cycling Shoes'},
        {'product':'assets/images/cycling 8.jpg','name':'cycle'},
        {'product':'assets/images/cycling 9  for Female Cyclists.jpg','name':'Female Cyclists'},
        
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

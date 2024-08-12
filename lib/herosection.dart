import  'package:flutter/material.dart';
class Herosection extends StatelessWidget{ 

   final List<Map<String, String>> heroItems = [
       {
       'image': 'assets/images/shoes 1.jpg',
      'topLeftText': 'Super Flash Sale',
       'bottomleftText':'50% Off',
                 },
       {
      'image':'assets/images/sport 4 Bottom Sneakers.jpg',
     'topLeftText': 'Super Flash Sale ',
       'bottomleftText':'50% Off',
    },
    {
      'image': 'assets/images/shoes 3.jpg',
      'topLeftText': 'Super Flash Sale',
       'bottomleftText':'50% Off',
    },
    {
      'image': 'assets/images/shoes 4.jpg',
     'topLeftText': 'Super Flash Sale',
       'bottomleftText':'50% Off',
          
    },
  ];
      
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 230,
          padding:const EdgeInsets.all(1),
          
         child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const PageScrollPhysics(),
            itemCount: heroItems.length + 1, // +1 for the See More button
            itemBuilder: (context, index) {
              if (index == heroItems.length) {
                return Container();
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 400,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Image.asset(heroItems[index]['image']!,fit: BoxFit.fitWidth,) ,
                    ),
                    Positioned(
                      top: 25,
                      left: 24,
                      child: Text(
                        heroItems[index]['topLeftText']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 132,
                      left: 25,
                      child: Text(
                        heroItems[index]['bottomleftText']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                     Positioned( 
                      left: 25,
                      bottom: 30,
                      
                      child: ElevatedButton(
        onPressed: () {
          // Handle See More button press
          print('Search');
        },
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:const Text(
          'See More',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      ),
                     )
                  ],
                ),
              );
            },
          ),
        ),

        
      ],
    );
  }

}



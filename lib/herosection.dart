import  'package:flutter/material.dart';
class Herosection extends StatelessWidget{ 

   final List<Map<String, String>> heroItems = [
       {
       'image': 'assets/images/shoes 1.jpg',
      'topLeftText': 'super flash sale',
       'bottomleftText':'50% off',
                 },
       {
      'image': 'assets/images/shoes 2.jpg',
     'topLeftText': 'super flash sale',
       'bottomleftText':'50% off',
    },
    {
      'image': 'assets/images/shoes 3.jpg',
      'topLeftText': 'super flash sale',
       'bottomleftText':'50% off',
    },
    {
      'image': 'assets/images/shoes 4.jpg',
     'topLeftText': 'super flash sale',
       'bottomleftText':'50% off',
          
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
                return SeeMoreButton();
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
                      child:Image.asset(heroItems[index]['image']!,fit: BoxFit.cover,) ,
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Text(
                        heroItems[index]['topLeftText']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        heroItems[index]['bottomleftText']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
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

class SeeMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin:const  EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle See More button press
          print('Search');
        },
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
    );
  }
}

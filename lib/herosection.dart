import 'package:flutter/material.dart';

class Herosection extends StatefulWidget {
  @override
  _HerosectionState createState() => _HerosectionState();
}

class _HerosectionState extends State<Herosection> {
  final PageController _pageController = PageController(); // Page controller
  int _currentPage = 0; // To track the current page

  final List<Map<String, String>> heroItems = [
    {
      'image': 'assets/images/shoes 1.jpg',
      'topLeftText': 'Super Flash Sale',
      'bottomleftText': '50% Off',
    },
    {
      'image': 'assets/images/sport 4 Bottom Sneakers.jpg',
      'topLeftText': 'Super Flash Sale',
      'bottomleftText': '50% Off',
    },
    {
      'image': 'assets/images/shoes 3.jpg',
      'topLeftText': 'Super Flash Sale',
      'bottomleftText': '50% Off',
    },
    {
      'image': 'assets/images/shoes 4.jpg',
      'topLeftText': 'Super Flash Sale',
      'bottomleftText': '50% Off',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 230,
          padding: const EdgeInsets.all(1),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index; // Update the current page index
              });
            },
            itemCount: heroItems.length,
            itemBuilder: (context, index) {
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
                      child: Image.asset(
                        heroItems[index]['image']!,
                        fit: BoxFit.fitWidth,
                      ),
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
                          print('See More pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
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
        const SizedBox(height: 16),
        // Custom Page Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(heroItems.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentPage == index ? 10.0 : 8.0, // Wider if selected
              height: 8.0,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : const Color.fromARGB(255, 190, 188, 188),
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
      ],
    );
  }
}

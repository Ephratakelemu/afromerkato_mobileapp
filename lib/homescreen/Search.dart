import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchSubmitted;

  const Search({Key? key, required this.onSearchChanged,required this.onSearchSubmitted,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  
                  onChanged: onSearchChanged,
                     onSubmitted: (query) {
                    // Trigger the callback when Enter is pressed
                    onSearchSubmitted();
                  }, 
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search product",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

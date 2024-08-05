
import  'package:flutter/material.dart';

class Searchbar extends StatelessWidget{
  const Searchbar({super.key});

  @override
Widget build(BuildContext context) {
  return SafeArea(child: SingleChildScrollView(
child: Container(
  height: 60,
  width: MediaQuery.of(context).size.width,
   padding:const EdgeInsets.symmetric(
      horizontal:20),
child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
   Container(
      width: 350,
      //height: 50,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(15), ),
        child: const TextField (
        
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText:"search product",
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0,
            vertical: 10.0,),
         ),
        ),
    ),

]
    )
),
)
  );
}
}
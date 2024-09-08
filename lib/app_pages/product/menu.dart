import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const MenuItem({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
     
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }

  
}

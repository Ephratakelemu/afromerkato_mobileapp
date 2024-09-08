import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  final Image? image;
  final Color? selectedColor;
  final String? selectedSize;
  final int quantity;
  final double price;
  

  const BottomSheetPage({
    Key? key,
    this.image,
    this.selectedColor,
    this.selectedSize,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200, 
            child: image ?? Placeholder(), //  placeholder if no image is provided
          ),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Selected Color:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: selectedColor ?? Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Selected Size: ${selectedSize ?? 'Not selected'}',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Quantity: $quantity',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: Size(double.infinity, 50),
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

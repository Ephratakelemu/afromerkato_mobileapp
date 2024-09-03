import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  final int quantity;
  final Image image; // Non-nullable since it's always passed
  final String? selectedSize;
  final Color? selectedColor;
  final VoidCallback onContinue;

  const BottomSheetContent({
    super.key,
    required this.quantity,
    required this.image,
    required this.selectedSize,
    required this.selectedColor,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 400.0, // Adjust height as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Summary',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Card(
            elevation: 4.0,
            child: SizedBox(
              height: 200.0, // Adjust height as needed
              child: image,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Quantity: $quantity',
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            'Size: ${selectedSize ?? 'Not selected'}',
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            'Color: ${selectedColor != null ? 'Selected' : 'Not selected'}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: onContinue,
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

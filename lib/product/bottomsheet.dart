import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  final int quantity;
  final String? selectedSize;
  final VoidCallback onContinue;

  const BottomSheetContent({
    super.key,
    required this.quantity,
    required this.selectedSize,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 600.0, 
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
          Text(
            'Quantity: $quantity',
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(
            'Size: ${selectedSize ?? 'Not selected'}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 20.0,width:400),
          ElevatedButton(
            onPressed: onContinue,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

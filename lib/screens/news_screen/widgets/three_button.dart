import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style; // Make the ButtonStyle nullable

  const MyButton({
    super.key, // Add key parameter
    required this.text,
    required this.onPressed,
    this.style,
  }); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ?? ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: AppColors.c_1A72DD, // Set border color to white
              width: 1, // Set border width to 1 pixel
            ),// Set circular border radius
          ), backgroundColor: AppColors.main, // Set background color to white
        ),
        child: Text(text), // Apply custom styles if provided, or use default styles
      ),
    );
  }
}

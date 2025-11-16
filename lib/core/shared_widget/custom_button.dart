import 'package:flutter/material.dart';
import '../utils/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  // Change VoidCallback to VoidCallback? to allow null
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.textLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        // Use a different color for the disabled state to give visual feedback
        backgroundColor: onPressed != null ? color : Colors.grey.shade300,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      // The onPressed parameter now correctly accepts a nullable function
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          // Change text color when disabled
          color: onPressed != null ? textColor : Colors.white70,
        ),
      ),
    );
  }
}

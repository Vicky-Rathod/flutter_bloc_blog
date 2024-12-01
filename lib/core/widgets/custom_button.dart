import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed, this.disabled = true});
  final String text;
  final void Function()? onPressed;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: disabled ? const Color.fromARGB(255, 177, 176, 179) : Colors.black, width: 2), // Border color and width
          boxShadow: [
            BoxShadow(
              color: disabled ? Colors.black26 : Colors.black38, // Shadow color
              offset: const Offset(3, 3), // Shadow position offset
              blurRadius: 0, // No blur for a sharp shadow
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black, // Text color
                fontSize: 16, // Text size
                fontWeight: FontWeight.bold, // Bold text
              ),
            ),
          ),
        ),
      ),
    );
  }
}

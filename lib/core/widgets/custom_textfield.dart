import 'package:flutter/material.dart';

enum FieldType { normal, search, email, password }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final FieldType fieldType;
  final IconData? suffixIcon, prefixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double height, width;
  final double radius;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.fieldType,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    required this.height,
    required this.width,
    this.radius = 0,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 3,
          left: 3,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              border: Border.all(color: Colors.black, width: 1),
            ),
          ),
        ),
        Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(widget.radius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(4, 4),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              // contentPadding: const EdgeInsets.only(top: 8),
              prefixIconConstraints: const BoxConstraints(maxWidth: 30),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: Colors.black,
                    )
                  : null,

              suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon, color: Colors.black) : null,
            ),
            style: const TextStyle(fontSize: 18, color: Colors.black),
            keyboardType: _getKeyboardType(),
            obscureText: widget.fieldType == FieldType.password,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.fieldType) {
      case FieldType.email:
        return TextInputType.emailAddress;
      case FieldType.password:
        return TextInputType.visiblePassword;
      case FieldType.search:
        return TextInputType.text;
      case FieldType.normal:
      default:
        return TextInputType.text;
    }
  }
}

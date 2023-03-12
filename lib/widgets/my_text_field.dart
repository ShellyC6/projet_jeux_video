import 'package:flutter/material.dart';
import '/app_colors.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.text, required this.obscureText});

  final String text;
  final bool obscureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyLarge,
      obscureText: widget.obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        filled: true,
        border: InputBorder.none,
        fillColor: AppColors.contrastColor,
      ),
    );
  }
}



/*

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyLarge,
      obscureText: true,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: "C'est mon test",
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        filled: true,
        border: InputBorder.none,
        fillColor: AppColors.contrastColor,
      ),
    );
  }

 */
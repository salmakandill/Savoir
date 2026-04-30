import 'package:flutter/material.dart';

class TextFeildwidget extends StatelessWidget {
const TextFeildwidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: const Color(0xFFFAF3E0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

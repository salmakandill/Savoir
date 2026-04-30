import 'package:flutter/material.dart';

class LabelOfTextFeildwidget extends StatelessWidget {
  const LabelOfTextFeildwidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

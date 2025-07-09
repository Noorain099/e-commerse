import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icons;
  final TextEditingController controller;
  const CustomTextField({
    super.key, required this.label, required this.icons, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          focusedBorder: OutlineInputBorder(),
          enabled: true,
          enabledBorder: OutlineInputBorder(),
          prefixIcon: Icon(icons),
          
        ),
        controller: controller ,
      ),
    );
  }
}
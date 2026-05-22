import 'package:flutter/material.dart';


class CustomsTextField extends StatelessWidget {
  // final String label;
  final String hint;
  final bool obscure;
  final TextEditingController? controller;

  const CustomsTextField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color.fromRGBO(69, 30, 187, 1),
                width: 2.0
              )
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            )
          ),
        ),
        const SizedBox(height: 15),
        
      ],
    );
  }
}
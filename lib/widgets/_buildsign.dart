import 'package:flutter/material.dart';

class CustomsTextField extends StatefulWidget {
  final String hint;
  final bool isPasswordField;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  const CustomsTextField({
    super.key,
    required this.hint,
    this.isPasswordField = false,
    this.controller,
    this.prefixIcon,
  });

  @override
  State<CustomsTextField> createState() => _CustomsTextFieldState();
}

class _CustomsTextFieldState extends State<CustomsTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            
            prefixIcon: widget.prefixIcon != null 
                ? Icon(widget.prefixIcon, color: const Color.fromRGBO(69, 30, 187, 1)) 
                : null,
            
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,

            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color.fromRGBO(69, 30, 187, 1),
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
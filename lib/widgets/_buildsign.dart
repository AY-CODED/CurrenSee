
import 'package:flutter/material.dart';

class CustomsTextField extends StatefulWidget {
  final String hint;
  final bool isPasswordField; // 💡 True if this field is meant for passwords
  final TextEditingController? controller;
  final IconData? prefixIcon;

  const CustomsTextField({
    super.key,
    required this.hint,
    this.isPasswordField = false, // Defaults to a regular text field
    this.controller,
    this.prefixIcon,
  });

  @override
  State<CustomsTextField> createState() => _CustomsTextFieldState();
}

class _CustomsTextFieldState extends State<CustomsTextField> {
  // 💡 This internal state tracks visibility inside the custom field
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // If it's a password field, start obscured (hidden). Otherwise, start visible.
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
          obscureText: _obscureText, // Controlled internally
          decoration: InputDecoration(
            hintText: widget.hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            
            // Prefix Icon Setup
            prefixIcon: widget.prefixIcon != null 
                ? Icon(widget.prefixIcon, color: const Color.fromRGBO(69, 30, 187, 1)) 
                : null,
            
            // 💡 Suffix Icon is handled automatically if it's a password field
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      // Toggles the state locally inside this widget
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null, // No eye icon for regular text fields

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
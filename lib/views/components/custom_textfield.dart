import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.error = '',
    required this.hint,
    this.obscureText = false,
    this.errorColor = Colors.amber,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final TextEditingController controller;
  final String error;
  final String hint;
  final bool obscureText;
  final Color errorColor;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            hintText: hint,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Visibility(
          visible: error.isEmpty ? false : true,
          child: Text(
            error,
            style: TextStyle(color: errorColor, fontSize: 14),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool? isPasswordField;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.label,this.isPasswordField,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          cursorColor: Colors.white,
          validator: (value) =>
          value!.isEmpty ? "Data cannot be empty" : null,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: isPasswordField==true? Icon(Icons.visibility,color: Colors.white,) : null,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffDFE1E6)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffDFE1E6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            errorStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
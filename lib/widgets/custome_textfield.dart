import 'package:flutter/material.dart';

class CustomeField extends StatelessWidget {
  const CustomeField({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty || value.trim().isEmpty || value.length < 12) {
            return "Unvalid Vaalue";
          } else {
            return null;
          }
        },
        obscureText: (title == "password" || title == "confirm password"),
        keyboardType: (title == "password" || title == "confirm password")
            ? TextInputType.number
            : TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: title,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black, width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black, width: 2)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black, width: 2))),
      ),
    );
  }
}

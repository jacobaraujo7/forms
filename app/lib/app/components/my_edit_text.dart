import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyEditText extends StatelessWidget {
  final String label;
  final String value;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const MyEditText({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: inputFormatters,
    );
  }
}

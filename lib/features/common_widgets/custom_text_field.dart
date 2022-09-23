import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/theme/theme_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    this.keyboardType,
    this.fillColor,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      enabled: enabled,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: fillColor == null
              ? const BorderSide(
                  color: lightFontColor,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1,
          ),
        ),
        fillColor: fillColor ?? Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: context.tthm.titleSmall,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }
}

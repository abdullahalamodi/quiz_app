import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    Key? key,
    required this.onChanged,
    required this.onCountryChanged,
    this.validator,
  }) : super(key: key);
  final void Function(PhoneNumber phoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
          onChanged: onChanged,
          onCountryChanged: onCountryChanged,
          validator: validator,
          initialCountryCode: kInitialCountryCode,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'phone number',
            hintStyle: context.tthm.titleSmall,
            // isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0XFFcdcdcd)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // errorStyle: const TextStyle(fontSize: 0, height: 1),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red[600]!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

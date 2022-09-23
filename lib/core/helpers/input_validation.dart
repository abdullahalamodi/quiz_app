import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/phone_number.dart';

class InputValidation {
  static String? validateName(
    BuildContext context,
    String? val,
  ) {
    if (val == null || val.trim().isEmpty) {
      return 'name shoudn\'t be empty !';
    } else if (val.length < 3) {
      return 'name shoudn\'t be less than 4 letters !';
    } else {
      return null;
    }
  }

  static String? validatePhone(
    BuildContext context,
    PhoneNumber? val,
  ) {
    if (val!.number.isEmpty) {
      return 'phone shoudn\'t be empty !';
    } else {
      return null;
    }
  }
}

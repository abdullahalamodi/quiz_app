import 'package:flutter/material.dart';

const double kRadius = 12;
const double kHorizontalPagePadding = 16;
const kPagePadding = EdgeInsets.only(
  right: kHorizontalPagePadding,
  left: kHorizontalPagePadding,
);

const ScrollPhysics kPhysics = BouncingScrollPhysics();

const String kInitialCountryCode = 'SA';

const kBoxShadow = BoxShadow(
  blurRadius: 5,
  color: Color.fromARGB(255, 228, 228, 228),
  offset: Offset(0, 2),
);

// pref kies
const String kUserModel = 'user_model_key';
const String kToken = 'token_key_3';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    Key? key,
    this.controller,
    this.onCompleted,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        controller: controller,
        autoFocus: true,
        autoDisposeControllers: false,
        length: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          // borderRadius: BorderRadius.circular(kRadius),
          fieldHeight: 58,
          fieldWidth: 54,
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 6),
          activeFillColor: primaryColor,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          activeColor: primaryColor,
          selectedColor: primaryColor,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        errorTextSpace: 25,
        autovalidateMode: AutovalidateMode.disabled,
        textStyle: context.tthm.titleLarge!.copyWith(
          color: Colors.white,
        ),
        onCompleted: onCompleted,
        onChanged: (value) {},
        onSubmitted: onCompleted,
        onTap: () {
          controller?.clear();
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}

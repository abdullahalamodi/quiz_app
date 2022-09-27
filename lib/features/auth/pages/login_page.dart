// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/helpers/input_validation.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/auth/pages/verfiy_otp_page.dart';
import 'package:quiz_app/features/auth/providers/auth_provider.dart';
import 'package:quiz_app/features/common_widgets/phone_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> validate(
    BuildContext context,
    AuthProvider provider,
  ) async {
    if (provider.loginFormKey.currentState!.validate()) {
      final isValid = await provider.validatePhone();
      if (isValid) {
        // flutter will add mounted check for stateless
        // then we can access context safely
        context.push(builder: (_) => const VerfiyOtpPage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid phone number"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Container(
        padding: kPagePadding,
        child: SingleChildScrollView(
          physics: kPhysics,
          child: Form(
            key: provider.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Login to QuizU 😋',
                  style: context.tthm.headlineSmall,
                ),
                Text(
                  'are you ready,\njust enter your phone to start.',
                  style: context.tthm.titleSmall!.copyWith(
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                PhoneField(
                  onChanged: (phone) {
                    provider.phoneNumber = phone;
                  },
                  onCountryChanged: (country) {
                    provider.phoneNumber?.countryISOCode = country.code;
                    provider.phoneNumber?.countryCode = '+${country.dialCode}';
                  },
                  validator: (val) =>
                      InputValidation.validatePhone(context, val),
                ),
                const SizedBox(height: 10),
                Hero(
                  tag: 'intro',
                  child: ElevatedButton(
                    onPressed: () => validate(context, provider),
                    child: const Text(
                      'login',
                    ),
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

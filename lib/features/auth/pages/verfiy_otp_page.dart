import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/auth/pages/add_name_page.dart';
import 'package:quiz_app/features/auth/providers/auth_state.dart';
import 'package:quiz_app/features/auth/providers/auth_provider.dart';
import 'package:quiz_app/features/common_widgets/loading_overlay.dart';
import 'package:quiz_app/features/common_widgets/pin_code_field.dart';
import 'package:quiz_app/features/layout/layout_landing.dart';

class VerfiyOtpPage extends ConsumerWidget {
  const VerfiyOtpPage({Key? key}) : super(key: key);

  Future<void> login(
    BuildContext context,
    AuthProvider provider,
  ) async {
    final mobile = provider.phoneNumber!.completeNumber;
    final otp = provider.pinController.text;
    log(provider.phoneNumber!.completeNumber);
    provider.login(mobile, otp);
  }

  void stateListener(
    final BuildContext context,
    final AuthState state,
  ) {
    listenToLoadingState(context, state);
    if (state is LoggedIn) {
      if (state.userModel.name != null) {
        context.push(
          builder: (_) => const LayoutLanding(),
        );
      } else {
        context.push(
          builder: (_) => const AddNamePage(),
        );
      }
    } else if (state is Error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('some thing wrong happen while login.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void listenToLoadingState(BuildContext context, AuthState state) {
    log('VerfiyOtpPage : $state');
    if (state is Loading) {
      LoadingScreen().show(context: context);
    } else {
      LoadingScreen().hide();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authProvider.notifier);
    ref.listen<AuthState>(
      authProvider,
      (_, state) => stateListener(context, state),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: kPagePadding,
        child: SingleChildScrollView(
          physics: kPhysics,
          child: Column(
            children: [
              const SizedBox(height: 70),
              Text(
                'Verify Phone',
                style: context.tthm.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                'we send pin code to your phone ',
                style: context.tthm.titleSmall,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  provider.phoneNumber!.completeNumber
                      .replaceRange(5, 10, '*****'),
                  style: context.tthm.bodySmall,
                ),
              ),
              const SizedBox(height: 50),
              PinCodeField(
                controller: provider.pinController,
                onCompleted: (otp) {
                  if (ref.read(authProvider) is! Loading) {
                    login(context, provider);
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

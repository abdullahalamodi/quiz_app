import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/helpers/input_validation.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/auth/providers/auth_provider.dart';
import 'package:quiz_app/features/auth/providers/auth_state.dart';
import 'package:quiz_app/features/common_widgets/custom_text_field.dart';
import 'package:quiz_app/features/layout/layout_landing.dart';

class AddNamePage extends ConsumerWidget {
  const AddNamePage({Key? key}) : super(key: key);

  Future<void> addName(
    BuildContext context,
    AuthProvider provider,
  ) async {
    if (provider.addNameFormKey.currentState!.validate()) {
      provider.addName(provider.nameController.text);
    }
  }

  void stateListener(
    final BuildContext context,
    final AuthState state,
  ) {
    if (state is NameAdd) {
      context.push(
        builder: (_) => const LayoutLanding(),
      );
    } else if (state is Error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('some thing wrong happen while add name.'),
          backgroundColor: Colors.red,
        ),
      );
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
      appBar: AppBar(
        title: const Text('add Name'),
      ),
      body: Container(
        padding: kPagePadding,
        child: SingleChildScrollView(
          physics: kPhysics,
          child: Form(
            key: provider.addNameFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'We need your name',
                  style: context.tthm.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'enter your name, \nthat will apeare to users in the score list',
                  style: context.tthm.titleSmall!.copyWith(
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  hint: 'your name',
                  controller: provider.nameController,
                  validator: (val) =>
                      InputValidation.validateName(context, val),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => addName(context, provider),
                  child: const Text(
                    'add',
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/helpers/input_validation.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/auth/providers/auth_provider.dart';
import 'package:quiz_app/features/auth/providers/auth_state.dart';
import 'package:quiz_app/features/common_widgets/custom_text_field.dart';
import 'package:quiz_app/features/common_widgets/loading_overlay.dart';
import 'package:quiz_app/features/home/home_page.dart';

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
    listenToLoadingState(context, state);
    if (state is NameAdd) {
      context.push(
        builder: (_) => const HomePage(),
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

  void listenToLoadingState(BuildContext context, AuthState state) {
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
                  style: context.tthm.titleSmall,
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  hint: 'your name',
                  controller: provider.nameController,
                  validator: (val) =>
                      InputValidation.validateName(context, val),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => addName(context, provider),
                  child: Container(
                    height: 46,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                    child: Center(
                      child: Text(
                        'add',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
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

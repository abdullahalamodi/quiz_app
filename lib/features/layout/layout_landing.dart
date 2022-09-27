import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/layout/main_layout.dart';
import 'package:quiz_app/features/layout/provider/layout_provider.dart';
import 'package:quiz_app/features/layout/widgets/layout_app_par.dart';
import 'package:quiz_app/features/profile/providers/profile_provider.dart';

class LayoutLanding extends ConsumerWidget {
  const LayoutLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(layoutProvider);
    ref.watch(profileProvider);
    return MainLayout(
      appBar: const LayoutAppBar(),
      body: provider.currentItem.page,
    );
  }
}

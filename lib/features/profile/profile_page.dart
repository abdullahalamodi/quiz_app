import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/profile/providers/my_scores_provider.dart';
import 'package:quiz_app/features/profile/providers/profile_provider.dart';
import 'package:quiz_app/features/profile/widgets/my_score_list_item.dart';
import 'package:quiz_app/features/profile/widgets/profile_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(profileProvider);
    return Container(
      padding: kPagePadding,
      child: asyncData.when(
        data: (data) => Column(
          children: [
            const SizedBox(height: 20),
            ProfileWidget(user: data),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(kRadius),
                    ),
                    child: Text(
                      'My Scores',
                      style: context.tthm.titleMedium!.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Consumer(builder: (context, ref, child) {
                    final asyncScoresList = ref.watch(myScoresProvider);
                    return Expanded(
                      child: asyncScoresList.when(
                        data: (data) => data.isNotEmpty
                            ? ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) =>
                                    MyScoreListItem(
                                  item: data[index],
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      FixedAssets.questionIllus,
                                      height: 150,
                                    ),
                                    const SizedBox(height: 30),
                                    const Text('Your score list is empty.'),
                                  ],
                                ),
                              ),
                        loading: () => const Center(
                          child: Text('loading data ..'),
                        ),
                        error: (error, stackTrace) => Center(
                          child: CustomErrorWidget(
                            onPressed: () => ref.refresh(myScoresProvider),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
        loading: () => const Center(
          child: Text('loading data ..'),
        ),
        error: (_, __) => Center(
          child: CustomErrorWidget(
            onPressed: () {
              ref.refresh(profileProvider);
            },
          ),
        ),
      ),
    );
  }
}

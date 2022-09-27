import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/leaderboard/widgets/leaderboard_list.dart';
import 'package:quiz_app/features/leaderboard/leaderbord_provider.dart';

class LeaderboardPage extends ConsumerWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(leaderboardProvider);
    return asyncList.when(
      data: (data) => data.isNotEmpty
          ? LeaderboardList(items: data)
          : Center(
              child: CustomErrorWidget(
                onPressed: () {
                  ref.refresh(leaderboardProvider);
                },
              ),
            ),
      loading: () => const Center(
        child: Text('loading data ..'),
      ),
      error: (_, __) => Center(
        child: CustomErrorWidget(
          onPressed: () {
            ref.refresh(leaderboardProvider);
          },
        ),
      ),
    );
  }
}

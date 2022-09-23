import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/leaderboard/leaderboard_list_item.dart';
import 'package:quiz_app/features/leaderboard/leaderbord_provider.dart';

class LeaderboardPage extends ConsumerWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(leaderboardProvider);
    return asyncList.when(
      data: (data) => Container(
        color: const Color.fromARGB(31, 189, 189, 189),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ProviderScope(
            overrides: [
              leaderboardItemIndexProvider.overrideWithValue(index),
            ],
            child: const LeaderBoardListItem(),
          ),
        ),
      ),
      loading: () => const Center(
        child: Text('loading data ..'),
      ),
      error: (_, __) => CustomErrorWidget(
        onPressed: () {
          ref.refresh(leaderboardProvider);
        },
      ),
    );
  }
}

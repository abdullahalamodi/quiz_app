import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/leaderboard/leaderbord_provider.dart';
import 'package:quiz_app/features/leaderboard/widgets/leaderboard_list_item.dart';
import 'package:quiz_app/models/leaderboard_model.dart';

class LeaderboardList extends ConsumerStatefulWidget {
  const LeaderboardList({
    super.key,
    required this.items,
  });

  final List<LeaderBoardModel> items;

  @override
  ConsumerState<LeaderboardList> createState() => _LeaderboardListState();
}

class _LeaderboardListState extends ConsumerState<LeaderboardList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    ref.refresh(leaderboardProvider);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(31, 189, 189, 189),
      child: SmartRefresher(
        enablePullUp: false,
        enablePullDown: true,
        header: const WaterDropHeader(
          waterDropColor: primaryColor,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) => ProviderScope(
            overrides: [
              leaderboardItemIndexProvider.overrideWithValue(index),
            ],
            child: const LeaderBoardListItem(),
          ),
        ),
      ),
    );
  }
}

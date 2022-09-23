import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/leaderboard/leaderbord_provider.dart';

class LeaderBoardListItem extends ConsumerWidget {
  const LeaderBoardListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(leaderboardItemIndexProvider);
    final item = ref.watch(leaderboardItemProvider(index));
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        // boxShadow: const [kBoxShadow],
      ),
      child: Row(
        children: [
          Text(
            item.name,
            style: context.tthm.titleMedium,
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 46,
                width: 46,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: item.scorePrecentage),
                  curve: Curves.easeOutCubic,
                  duration: const Duration(seconds: 2),
                  builder: (context, value, _) => CircularProgressIndicator(
                    value: value,
                    strokeWidth: 3,
                    color: item.color,
                  ),
                ),
              ),
              Text(
                '${item.validScore}',
                style: context.tthm.titleMedium!.copyWith(
                  color: item.color,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

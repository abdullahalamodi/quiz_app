import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/models/my_score_model.dart';

class MyScoreListItem extends ConsumerWidget {
  const MyScoreListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MyScoreModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(kRadius),
        // boxShadow: const [kBoxShadow],
      ),
      child: Row(
        children: [
          Text(
            item.formatedDate,
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
                '${item.score}',
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

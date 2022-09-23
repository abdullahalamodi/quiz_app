import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/layout/provider/layout_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    Key? key,
    this.height = 75,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(layoutProvider);
    final items = provider.pagesList;
    return Container(
      constraints: BoxConstraints.loose(const Size(400, 95)),
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [kBoxShadow],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < items.length; i++) ...{
                  Expanded(
                    child: InkWell(
                      onTap: () => {
                        provider.selectIndex(i),
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            items[i].icon!,
                            color:
                                provider.index == i ? primaryColor : fontColor,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            items[i].pageName.name,
                            style: context.tthm.bodySmall!.copyWith(
                              color: provider.index == i
                                  ? primaryColor
                                  : fontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';

class QuizMeButton extends StatelessWidget {
  const QuizMeButton({
    Key? key,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1300),
        width: size.width,
        height: size.height,
        curve: Curves.easeOutBack,
        child: SizedBox(
          width: 120,
          height: 120,
          child: ColorSonar(
            duration: const Duration(seconds: 3),
            innerWaveColor: primaryColor.withOpacity(0.1),
            middleWaveColor: primaryColor.withOpacity(0.2),
            outerWaveColor: primaryColor.withOpacity(0.1),
            waveMotion: WaveMotion.smooth,
            child: Hero(
              tag: 'intro',
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColor,
                  ),
                  // boxShadow: const [kBoxShadow],
                ),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'quiz me',
                    style: context.tthm.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

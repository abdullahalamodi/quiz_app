import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:im_animations/im_animations.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/auth/pages/login_page.dart';
import 'package:quiz_app/features/auth/providers/token_povider.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/layout/layout_landing.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validToken = ref.watch(fetchTokenProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: context.h * 0.5),
              curve: Curves.easeOutBack,
              duration: const Duration(seconds: 1),
              builder: (context, value, _) => Hero(
                tag: 'intro',
                child: Container(
                  width: double.infinity,
                  padding: kPagePadding,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(value),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const SizedBox(height: 20),
                      Positioned(
                        top: 60,
                        right: 50,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 120),
                          curve: Curves.bounceInOut,
                          duration: const Duration(seconds: 1),
                          builder: (context, value, _) => Image.asset(
                            FixedAssets.questionMark,
                            height: value,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 300,
                          child: DefaultTextStyle(
                            style: context.tthm.titleLarge!.copyWith(
                              fontSize: 26.0,
                              color: Colors.white,
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    speed: const Duration(milliseconds: 70),
                                    'Welecom to QuizU\nwe are happy to join us,\nlets have some fun.'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        left: 20,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 40),
                          curve: Curves.bounceInOut,
                          duration: const Duration(seconds: 1),
                          builder: (context, value, _) => RotatedBox(
                            quarterTurns: 1,
                            child: Image.asset(
                              FixedAssets.questionMark,
                              height: value,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: validToken.when(
              data: (data) => Align(
                alignment: Alignment.topRight,
                widthFactor: 3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            data ? const LayoutLanding() : const LoginPage(),
                        transitionDuration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, _) => Opacity(
                      opacity: value,
                      child: SizedBox(
                        width: 110,
                        height: 110,
                        child: ColorSonar(
                          duration: const Duration(seconds: 3),
                          innerWaveColor: primaryColor.withOpacity(0.1),
                          middleWaveColor: primaryColor.withOpacity(0.2),
                          outerWaveColor: primaryColor.withOpacity(0.1),
                          waveMotion: WaveMotion.smooth,
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
                                'start',
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
                ),
              ),
              error: (_, __) => Align(
                  alignment: Alignment.topRight,
                  widthFactor: 3,
                  child: CustomErrorWidget(
                    onPressed: () {
                      ref.refresh(fetchTokenProvider);
                    },
                  )),
              loading: () => Align(
                alignment: Alignment.topRight,
                widthFactor: 3,
                child: Text(
                  'loading data ...',
                  style: context.tthm.bodyMedium!.copyWith(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

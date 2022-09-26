import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/home/widgets/quez_me_button.dart';
import 'package:quiz_app/features/questions/providers/questions_provider.dart';
import 'package:quiz_app/features/questions/pages/questions_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var textPosition = -100.0;
  var notePosition = 0.0;
  var buttonSize = const Size(130, 50);
  bool isOut = true;

  @override
  void didChangeDependencies() {
    //load questions when open home
    ref.watch(questionsProvider.notifier);
    notePosition = context.h;
    Future.delayed(const Duration(milliseconds: 550), () {
      toggel();
    });
    super.didChangeDependencies();
  }

  toggel() {
    textPosition = isOut ? context.h * 0.12 : -100;
    notePosition = isOut ? context.h * 0.3 : context.h;
    buttonSize = isOut ? const Size(130, 130) : const Size(200, 200);
    isOut = !isOut;
    setState(() {});
  }

  void animateAndPush() {
    toggel();
    Future.delayed(const Duration(seconds: 1), () {
      context.push(builder: (_) => const QuestionsPage());
      toggel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kPagePadding,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: textPosition,
              curve: Curves.easeInOutBack,
              child: DefaultTextStyle(
                style: context.tthm.titleLarge!.copyWith(
                  fontSize: 26.0,
                ),
                child: FutureBuilder(
                  future:
                      Future.delayed(const Duration(seconds: 1), () => true),
                  builder: (context, snapshot) => snapshot.hasData
                      ? AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                                speed: const Duration(milliseconds: 70),
                                'Are you ready \nto test your knowledge \nand challenge others?'),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              top: notePosition,
              width: 300,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'Answer as much questions correctly within 2 minutes',
                          style: context.tthm.titleMedium!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 60,
                right: 0,
                left: 0,
                child: QuizMeButton(
                  size: buttonSize,
                  onTap: () => animateAndPush(),
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/questions/questions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var r = -100.0;
  var n = 0.0;
  var b = const Size(130, 50);
  bool isOut = true;

  @override
  void didChangeDependencies() {
    n = context.h;
    Future.delayed(const Duration(milliseconds: 550), () {
      toggel();
    });
    super.didChangeDependencies();
  }

  toggel() {
    r = isOut ? context.h * 0.12 : -100;
    n = isOut ? context.h * 0.50 : context.h;
    b = isOut ? const Size(130, 50) : const Size(200, 100);
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
              top: r,
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
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1300),
                width: b.width,
                height: b.height,
                curve: Curves.easeOutBack,
                child: Hero(
                  tag: 'intro',
                  child: ElevatedButton(
                    onPressed: () => animateAndPush(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'quiz me',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              top: n,
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
          ],
        ),
      ),
    );
  }
}

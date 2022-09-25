import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/features/questions/timer_widget.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Hero(
                tag: 'intro',
                child: TimerWidget(
                  duration: 120, // 120 secound = 2 minutes
                  onComplete: () {
                    log('completed');
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

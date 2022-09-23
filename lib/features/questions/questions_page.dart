import 'dart:developer';

import 'package:flutter/material.dart';

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
                child: ElevatedButton(
                  onPressed: () => log('mm'),
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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

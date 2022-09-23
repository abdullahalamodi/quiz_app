import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/theme/theme_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text('ready'),
          Center(
            child: Hero(
              tag: 'intro',
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                  child: Center(
                    child: FutureBuilder<String>(
                      future: Future.delayed(
                          const Duration(milliseconds: 500), () => 'quiz me'),
                      builder: (context, snapshot) => Text(
                        snapshot.data ?? '',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

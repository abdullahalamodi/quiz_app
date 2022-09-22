import 'package:flutter/material.dart';
import 'package:quiz_app/features/home/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomePage(),
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: (_, a, __, c) =>
                ScaleTransition(scale: a, child: c),
          ),
        ),
        child: Hero(
          tag: 'hh',
          child: Container(
            height: double.infinity,
            color: Colors.red,
            width: double.infinity,
            child: const Text('hallo'),
          ),
        ),
      ),
    );
  }
}

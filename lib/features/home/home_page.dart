import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'hh',
          child: Container(
            height: 60,
            width: 120,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

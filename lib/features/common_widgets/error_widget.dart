import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('field load data.'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('try again'),
        )
      ],
    );
  }
}

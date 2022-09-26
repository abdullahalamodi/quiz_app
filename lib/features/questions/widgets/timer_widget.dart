import 'package:flutter/material.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.onComplete,
    required this.duration,
  }) : super(key: key);

  final void Function() onComplete;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1),
      curve: Curves.linear,
      duration: Duration(seconds: duration),
      onEnd: onComplete,
      builder: (context, value, _) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 3,
              color: _getColor((value * duration).toInt()),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: _getColor((value * duration).toInt()),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _formatedTime(value, duration),
                style: context.tthm.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  MaterialColor _getColor(count) {
    if (count > (duration * .8)) {
      return Colors.red;
    } else if (count > (duration * .6)) {
      return Colors.orange;
    } else if (count > (duration * .5)) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }

  String _formatedTime(double value, int duration) {
    final time = duration - (value * duration);
    final minutes = time ~/ 60;
    final secounds = (time % 60).toInt();
    return '$minutes:$secounds';
  }
}

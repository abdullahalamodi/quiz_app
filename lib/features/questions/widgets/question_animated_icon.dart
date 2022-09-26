import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';

class QuestionAnimatedIcon extends StatefulWidget {
  const QuestionAnimatedIcon({
    Key? key,
    this.height = 20,
    this.color = Colors.green,
  }) : super(key: key);

  final double height;
  final Color color;

  @override
  State<QuestionAnimatedIcon> createState() => _QuestionAnimatedIconState();
}

class _QuestionAnimatedIconState extends State<QuestionAnimatedIcon>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  final Tween<double> _tween = Tween(begin: .9, end: 1);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1100), vsync: this);
    _controller?.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaleTransition(
          scale: _tween.animate(
            CurvedAnimation(
              parent: _controller!,
              curve: Curves.easeInOut,
            ),
          ),
          child: SvgPicture.asset(
            FixedAssets.qMark,
            height: widget.height,
            color: widget.color,
          ),
        ),
      ],
    );
  }
}

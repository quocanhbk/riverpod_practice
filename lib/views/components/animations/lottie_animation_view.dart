import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_practice/views/components/animations/models/lotttie_animation.dart';

class LottieAnimationView extends StatelessWidget {
  final LottieAnimation animation;
  final bool repeat;
  final bool reverse;

  const LottieAnimationView({
    super.key,
    required this.animation,
    this.repeat = true,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animations/${animation.name}.json',
      repeat: repeat,
      reverse: reverse,
    );
  }
}

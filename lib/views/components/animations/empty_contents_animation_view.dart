import 'package:riverpod_practice/views/components/animations/lottie_animation_view.dart';
import 'package:riverpod_practice/views/components/animations/models/lotttie_animation.dart';

class EmptyContentsAnimationView extends LottieAnimationView {
  const EmptyContentsAnimationView({super.key})
      : super(animation: LottieAnimation.empty);
}

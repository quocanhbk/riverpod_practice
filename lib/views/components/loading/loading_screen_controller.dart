import 'package:flutter/foundation.dart' show immutable;

// this loading screen controller should have 2 features: open/close and update loading message

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingMessage = bool Function(String message);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingMessage updateMessage;

  const LoadingScreenController({
    required this.close,
    required this.updateMessage,
  });
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_practice/views/components/constants/string.dart';
import 'package:riverpod_practice/views/components/loading/loading_screen_controller.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();

  factory LoadingScreen.instance() {
    return _shared;
  }

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
    String message = Strings.loading,
  }) {
    if (_controller?.updateMessage(message) ?? false) {
      return;
    }

    _controller = showOverlay(context: context, message: message);
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController? showOverlay({
    required BuildContext context,
    required String message,
  }) {
    try {
      final state = Overlay.of(context);
      final textController = StreamController<String>();
      textController.add(message);

      final overlay = OverlayEntry(
        builder: (context) {
          return Material(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    StreamBuilder<String>(
                      stream: textController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

      state.insert(overlay);

      return LoadingScreenController(
        close: () {
          overlay.remove();
          textController.close();
          return true;
        },
        updateMessage: (String message) {
          textController.add(message);
          return true;
        },
      );
    } catch (e) {
      return null;
    }
  }
}

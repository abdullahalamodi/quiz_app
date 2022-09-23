import 'package:flutter/material.dart';

class LoadingScreen {
  factory LoadingScreen() => _shared;
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();

  LoadingScreenController? _controller;

  void show({
    required BuildContext context,
  }) {
    _controller = showOverlay(
      context: context,
    );
  }

  void hide() {
    _controller?.close();
    _controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
  }) {
    final state = Overlay.of(context);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black38,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
        );
      },
    );

    state?.insert(overlay);

    return LoadingScreenController(
      close: () {
        overlay.remove();
        return true;
      },
    );
  }
}

typedef CloseLoadingScreen = bool Function();

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;

  const LoadingScreenController({
    required this.close,
  });
}

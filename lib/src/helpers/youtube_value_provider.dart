import 'package:flutter/widgets.dart';

import '../controller.dart';

/// An inherited widget to provide [YoutubePlayerController] to it's descendants.
class YoutubePlayerControllerProvider extends InheritedWidget {
  /// The [YoutubePlayerController].
  final YoutubePlayerController controller;

  /// An inherited widget that provide [YoutubePlayerController] to it's descendants.
  const YoutubePlayerControllerProvider({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  /// Finds the most recent [YoutubePlayerController] in its ancestors.
  static YoutubePlayerController of(BuildContext context) {
    final controllerProvider = context
        .dependOnInheritedWidgetOfExactType<YoutubePlayerControllerProvider>();
    assert(
      controllerProvider != null,
      'Cannot find YoutubePlayerControllerProvider above. Please wrap parent widget with YoutubePlayerControllerProvider.',
    );
    return controllerProvider!.controller;
  }

  @override
  bool updateShouldNotify(YoutubePlayerControllerProvider old) =>
      old.controller.hashCode != controller.hashCode;
}

/// YoutubePlayerControllerExtension
extension YoutubePlayerControllerExtension on BuildContext {
  /// Finds the most recent [YoutubePlayerController] in its ancestors.
  YoutubePlayerController get ytController =>
      YoutubePlayerControllerProvider.of(this);
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A customized scroll behavior that enables dragging using both touch and mouse input devices.
///
/// This scroll behavior extends the default [MaterialScrollBehavior] to allow
/// dragging interactions for both touch and mouse input devices. By default,
/// the [MaterialScrollBehavior] only supports touch-based dragging. This custom
/// behavior makes it suitable for widgets that should respond to dragging with
/// both touch and mouse input, such as scrollable content.
class DragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        // Enable dragging using both touch and mouse input devices.
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

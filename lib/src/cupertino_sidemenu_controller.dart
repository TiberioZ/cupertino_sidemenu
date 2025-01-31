import 'package:flutter/widgets.dart';

class CupertinoSidemenuController extends ChangeNotifier {
  VoidCallback? _openLeft;
  VoidCallback? _openRight;
  VoidCallback? _close;

  void attach({
    required VoidCallback openLeft,
    required VoidCallback openRight,
    required VoidCallback close,
  }) {
    _openLeft = openLeft;
    _openRight = openRight;
    _close = close;
  }

  void openLeftMenu() {
    _openLeft?.call();
  }

  void openRightMenu() {
    _openRight?.call();
  }

  void closeMenu() {
    _close?.call();
  }
}

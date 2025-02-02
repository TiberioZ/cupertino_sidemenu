import 'package:flutter/cupertino.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'cupertino_sidemenu_controller.dart';

class CupertinoSidemenu extends StatefulWidget {
  const CupertinoSidemenu({
    required this.centerPage,
    this.leftMenu,
    this.rightMenu,
    this.menuWidthOfScreen = 0.80,
    this.hapticFeedback = true,
    this.animationSpeed = 300,
    this.animationCurves = Curves.easeOutCubic,
    this.centerBackgroundOpacity = 0.25,
    this.controller,
    super.key,
  });

  /// The percentage of screen width used for side menus (default 80%).
  final double menuWidthOfScreen;

  /// Enables or disables haptic feedback when switching menus.
  final bool hapticFeedback;

  /// Animation speed in milliseconds.
  final int animationSpeed;

  /// Animation curve.
  final Curve animationCurves;

  /// Opacity of the background when the menu is open.
  final double centerBackgroundOpacity;

  /// The left side menu widget (optional).
  final Widget? leftMenu;

  /// The right side menu widget (optional).
  final Widget? rightMenu;

  /// The center page that remains visible.
  final Widget centerPage;

  /// Controller for opening and closing menus.
  final CupertinoSidemenuController? controller;

  @override
  CupertinoSidemenuState createState() => CupertinoSidemenuState();
}

class CupertinoSidemenuState extends State<CupertinoSidemenu>
    with SingleTickerProviderStateMixin {
  double offsetX = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;
  double lastOffsetX = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.animationSpeed));
  }

  void animateToPosition(double targetOffset) {
    if (widget.hapticFeedback && targetOffset != lastOffsetX) {
      Haptics.vibrate(HapticsType.soft);
    }
    lastOffsetX = targetOffset;

    _animation = Tween<double>(begin: offsetX, end: targetOffset).animate(
      CurvedAnimation(parent: _controller, curve: widget.animationCurves),
    )..addListener(() {
        setState(() {
          offsetX = _animation.value;
        });
      });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double sidemenu = screenWidth * widget.menuWidthOfScreen;

    widget.controller?.attach(
      openLeft: () =>
          widget.leftMenu != null ? animateToPosition(sidemenu) : null,
      openRight: () =>
          widget.rightMenu != null ? animateToPosition(-sidemenu) : null,
      close: () => animateToPosition(0),
    );

    return CupertinoPageScaffold(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            offsetX += details.primaryDelta!;
            offsetX = offsetX.clamp(
              widget.rightMenu != null ? -sidemenu : 0,
              widget.leftMenu != null ? sidemenu : 0,
            );
          });
        },
        onHorizontalDragEnd: (details) {
          double velocity = details.primaryVelocity ?? 0.0;
          double targetOffset = 0;

          if (velocity.abs() > 100) {
            if (offsetX > 0 && widget.leftMenu != null) {
              if (velocity > 0) {
                targetOffset = sidemenu;
              } else {
                targetOffset = 0;
              }
            } else if (offsetX < 0 && widget.rightMenu != null) {
              if (velocity < 0) {
                targetOffset = -sidemenu;
              } else {
                targetOffset = 0;
              }
            }
          } else {
            if (offsetX > sidemenu / 2) {
              targetOffset = sidemenu;
            } else if (offsetX < -sidemenu / 2) {
              targetOffset = -sidemenu;
            } else {
              targetOffset = 0;
            }
          }

          animateToPosition(targetOffset);
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Transform.translate(
            offset:
                Offset(offsetX - (widget.leftMenu != null ? sidemenu : 0), 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.leftMenu != null)
                  SizedBox(
                    width: sidemenu,
                    height: MediaQuery.of(context).size.height,
                    child: widget.leftMenu ?? const SizedBox(),
                  ),
                GestureDetector(
                  onTap: () {
                    if (offsetX != 0) {
                      animateToPosition(0);
                    }
                  },
                  child: SizedBox(
                    width: screenWidth,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        widget.centerPage,
                        IgnorePointer(
                          ignoring: offsetX.abs() == 0,
                          child: AnimatedContainer(
                            curve: widget.animationCurves,
                            duration:
                                Duration(milliseconds: widget.animationSpeed),
                            width: screenWidth,
                            height: MediaQuery.of(context).size.height,
                            color: CupertinoColors.systemGrey.withOpacity(
                              (offsetX.abs() / sidemenu)
                                  .clamp(0.0, widget.centerBackgroundOpacity),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.rightMenu != null)
                  SizedBox(
                    width: sidemenu,
                    height: MediaQuery.of(context).size.height,
                    child: widget.rightMenu,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

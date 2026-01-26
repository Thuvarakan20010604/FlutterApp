import 'package:flutter/material.dart';

class ScaleTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const ScaleTap({super.key, required this.child, this.onTap});

  @override
  State<ScaleTap> createState() => _ScaleTapState();
}

class _ScaleTapState extends State<ScaleTap> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 110),
    lowerBound: 0.0,
    upperBound: 0.04,
  );

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _c.forward(),
      onTapCancel: () => _c.reverse(),
      onTapUp: (_) {
        _c.reverse();
        widget.onTap?.call();
      },
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, child) {
          final s = 1 - _c.value;
          return Transform.scale(scale: s, child: child);
        },
        child: widget.child,
      ),
    );
  }
}

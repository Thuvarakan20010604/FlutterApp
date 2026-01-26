import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).cardColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.35)),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 16),
            color: Colors.black.withOpacity(isDark ? 0.35 : 0.08),
          ),
        ],
      ),
      child: child,
    );
  }
}

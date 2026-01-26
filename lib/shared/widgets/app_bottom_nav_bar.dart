import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const AppBottomNavBar({super.key, required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: onChanged,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.receipt_long_outlined), label: 'Txns'),
        NavigationDestination(icon: Icon(Icons.account_balance_outlined), label: 'Banks'),
        NavigationDestination(icon: Icon(Icons.savings_outlined), label: 'Savings'),
        NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
      ],
    );
  }
}

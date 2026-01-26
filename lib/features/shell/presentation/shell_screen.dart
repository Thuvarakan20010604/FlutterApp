import 'package:flutter/material.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../transactions/presentation/transactions_screen.dart';
import '../../banks/presentation/banks_screen.dart';
import '../../savings/presentation/savings_screen.dart';
import '../../settings/presentation/settings_screen.dart';

class ShellScreen extends StatefulWidget {
  final AuthRepository auth;
  const ShellScreen({super.key, required this.auth});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardScreen(),
      const TransactionsScreen(),
      const BanksScreen(),
      const SavingsScreen(),
      SettingsScreen(auth: widget.auth),
    ];

    return Scaffold(
      body: SafeArea(child: pages[_index]),
      bottomNavigationBar: AppBottomNavBar(
        index: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }
}

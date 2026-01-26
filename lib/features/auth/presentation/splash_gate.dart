import 'package:flutter/material.dart';
import '../../../data/datasources/auth_local_ds.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../services/session/session_service.dart';
import '../../shell/presentation/shell_screen.dart';
import 'login_screen.dart';

class SplashGate extends StatefulWidget {
  const SplashGate({super.key});

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> {
  late final AuthRepository _auth;

  @override
  void initState() {
    super.initState();
    _auth = AuthRepository(AuthLocalDs(), SessionService());
    _go();
  }

  Future<void> _go() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final current = _auth.currentUsername();
    if (!mounted) return;

    if (current == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen(auth: _auth)),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ShellScreen(auth: _auth)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

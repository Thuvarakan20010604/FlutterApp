import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'features/auth/presentation/splash_gate.dart';
import 'features/settings/application/settings_controller.dart';
import 'services/session/settings_service.dart';

class MyDigitalWalletApp extends StatefulWidget {
  const MyDigitalWalletApp({super.key});

  @override
  State<MyDigitalWalletApp> createState() => _MyDigitalWalletAppState();
}

class _MyDigitalWalletAppState extends State<MyDigitalWalletApp> {
  late final SettingsController settings;

  @override
  void initState() {
    super.initState();
    settings = SettingsController(SettingsService());
    settings.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Digital Wallet',
      debugShowCheckedModeBanner: false,
      themeMode: settings.themeMode,
      theme: buildLightTheme(fontFamily: settings.fontFamily),
      darkTheme: buildDarkTheme(fontFamily: settings.fontFamily),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(settings.textScale),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const SplashGate(),
    );
  }
}

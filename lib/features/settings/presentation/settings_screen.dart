import 'package:flutter/material.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../auth/presentation/login_screen.dart';
import '../application/settings_controller.dart';
import '../../../services/session/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  final AuthRepository auth;
  const SettingsScreen({super.key, required this.auth});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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

  Future<void> _logout() async {
    await widget.auth.logout();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => LoginScreen(auth: widget.auth)),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.auth.currentUsername() ?? 'unknown';

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Logged in as'),
              subtitle: Text(user),
            ),
          ),
          const SizedBox(height: 12),

          _card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.brightness_6_rounded),
                  title: Text('Appearance'),
                  subtitle: Text('Day / Night mode'),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: settings.themeMode,
                  onChanged: (v) => settings.setThemeMode(v!),
                  title: const Text('System'),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: settings.themeMode,
                  onChanged: (v) => settings.setThemeMode(v!),
                  title: const Text('Light (Day)'),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: settings.themeMode,
                  onChanged: (v) => settings.setThemeMode(v!),
                  title: const Text('Dark (Night)'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          _card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.text_fields_rounded),
                  title: Text('Font size'),
                  subtitle: Text('Change app text size'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Row(
                    children: [
                      const Text('A', style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: Slider(
                          value: settings.textScale.clamp(0.9, 1.3),
                          min: 0.9,
                          max: 1.3,
                          divisions: 4,
                          label: settings.textScale.toStringAsFixed(2),
                          onChanged: (v) => settings.setTextScale(v),
                        ),
                      ),
                      const Text('A', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          _card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.font_download_rounded),
                  title: Text('Font style'),
                  subtitle: Text('System / Custom font'),
                ),
                RadioListTile<String?>(
                  value: null,
                  groupValue: settings.fontFamily,
                  onChanged: (v) => settings.setFontFamily(v),
                  title: const Text('System default'),
                ),
                RadioListTile<String?>(
                  value: 'Inter',
                  groupValue: settings.fontFamily,
                  onChanged: (v) => settings.setFontFamily(v),
                  title: const Text('Inter (recommended)'),
                ),
                RadioListTile<String?>(
                  value: 'Poppins',
                  groupValue: settings.fontFamily,
                  onChanged: (v) => settings.setFontFamily(v),
                  title: const Text('Poppins'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.3)),
      ),
      child: child,
    );
  }
}

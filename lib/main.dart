import 'package:flutter/material.dart';
import 'services/storage/hive_initializer.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInitializer.init();
  runApp(const MyDigitalWalletApp());
}

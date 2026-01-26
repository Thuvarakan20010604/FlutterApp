import 'package:hive_flutter/hive_flutter.dart';
import 'hive_boxes.dart';

class HiveInitializer {
  HiveInitializer._();

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(HiveBoxes.users);
    await Hive.openBox<String>(HiveBoxes.session);
    await Hive.openBox(HiveBoxes.settings); // ✅ NEW (dynamic box)
  }
}

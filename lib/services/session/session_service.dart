import 'package:hive/hive.dart';
import '../storage/hive_boxes.dart';

class SessionService {
  static const String _keyCurrentUser = 'currentUser';

  Future<void> setCurrentUser(String username) async {
    final box = Hive.box<String>(HiveBoxes.session);
    await box.put(_keyCurrentUser, username);
  }

  String? getCurrentUser() {
    final box = Hive.box<String>(HiveBoxes.session);
    return box.get(_keyCurrentUser);
  }

  Future<void> clear() async {
    final box = Hive.box<String>(HiveBoxes.session);
    await box.delete(_keyCurrentUser);
  }
}

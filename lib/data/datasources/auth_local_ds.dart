import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';

import '../models/user_model.dart';
import '../../services/storage/hive_boxes.dart';

class AuthLocalDs {
  String _randomSalt() {
    final rand = Random.secure();
    final bytes = List<int>.generate(16, (_) => rand.nextInt(256));
    return base64UrlEncode(bytes);
  }

  String _hashPassword(String password, String salt) {
    final bytes = utf8.encode('$salt::$password');
    return sha256.convert(bytes).toString();
  }

  Future<bool> userExists(String username) async {
    final box = Hive.box<String>(HiveBoxes.users);
    return box.containsKey(username.trim().toLowerCase());
  }

  Future<UserModel> register({
    required String username,
    required String password,
  }) async {
    final u = username.trim().toLowerCase();
    final p = password.trim();

    if (u.isEmpty) {
      throw Exception('Username is required');
    }
    if (p.length < 4) {
      throw Exception('Password must be at least 4 characters');
    }

    final box = Hive.box<String>(HiveBoxes.users);

    if (box.containsKey(u)) {
      throw Exception('User already exists');
    }

    final salt = _randomSalt();
    final hash = _hashPassword(p, salt);

    final user = UserModel(
      username: u,
      passwordHash: hash,
      salt: salt,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    await box.put(u, user.toJson());
    return user;
  }

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final u = username.trim().toLowerCase();
    final p = password.trim();

    final box = Hive.box<String>(HiveBoxes.users);
    final json = box.get(u);

    if (json == null) {
      throw Exception('User not found');
    }

    final user = UserModel.fromJson(json);
    final candidate = _hashPassword(p, user.salt);

    if (candidate != user.passwordHash) {
      throw Exception('Invalid password');
    }

    return user;
  }

  Future<UserModel?> getUser(String username) async {
    final u = username.trim().toLowerCase();
    final box = Hive.box<String>(HiveBoxes.users);
    final json = box.get(u);
    if (json == null) return null;
    return UserModel.fromJson(json);
  }
}

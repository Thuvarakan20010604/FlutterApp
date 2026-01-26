import 'dart:convert';

class UserModel {
  final String username;
  final String passwordHash;
  final String salt; // per-user salt
  final int createdAt; // epoch millis

  UserModel({
    required this.username,
    required this.passwordHash,
    required this.salt,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
        'username': username,
        'passwordHash': passwordHash,
        'salt': salt,
        'createdAt': createdAt,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        username: map['username'],
        passwordHash: map['passwordHash'],
        salt: map['salt'],
        createdAt: map['createdAt'],
      );

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json) as Map<String, dynamic>);
}

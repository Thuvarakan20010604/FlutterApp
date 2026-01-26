import '../../services/session/session_service.dart';
import '../datasources/auth_local_ds.dart';
import '../models/user_model.dart';

class AuthRepository {
  final AuthLocalDs _ds;
  final SessionService _session;

  AuthRepository(this._ds, this._session);

  Future<UserModel> registerAndLogin({
    required String username,
    required String password,
  }) async {
    final user = await _ds.register(username: username, password: password);
    await _session.setCurrentUser(user.username);
    return user;
  }

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final user = await _ds.login(username: username, password: password);
    await _session.setCurrentUser(user.username);
    return user;
  }

  Future<void> logout() async {
    await _session.clear();
  }

  String? currentUsername() => _session.getCurrentUser();
}

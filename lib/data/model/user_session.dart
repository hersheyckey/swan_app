class UserSession {
  static final UserSession _instance = UserSession._internal();

  factory UserSession() {
    return _instance;
  }

  UserSession._internal();

  static UserSession get instance => _instance;

  String id = '';
  String token = '';
}

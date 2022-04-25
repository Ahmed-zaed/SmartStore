class ApiSettings {
  static const String _baseUrl = 'https://smart-store.mr-dev.tech/';
  static const String _baseApiUrl = _baseUrl + 'api/';
  static const _register = _baseApiUrl + 'auth/register';
  static const _login = _baseApiUrl + 'auth/login';
  static const _active = _baseApiUrl + 'auth/activate';
  static const _forgetPassword = _baseApiUrl + 'auth/forget-password';
  static const _logout = _baseApiUrl + 'auth/logout';
}

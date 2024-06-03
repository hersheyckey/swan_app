
import 'package:swaan_app/domain/api_service/api_service.dart';

class LoginRepository {
  final ApiService apiService;

  LoginRepository({required this.apiService});

  Future<Map<String, dynamic>> login(String emailPhone, String password) async {
    return await apiService.login(emailPhone, password);
  }
}

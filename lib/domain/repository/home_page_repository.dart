

import 'package:swaan_app/domain/api_service/api_service.dart';

class HomeRepository {
  final ApiService apiService;

  HomeRepository({required this.apiService});

  Future<Map<String, dynamic>> fetchData(String id, String token) async {
    return await apiService.fetchData(id, token);
  }
}

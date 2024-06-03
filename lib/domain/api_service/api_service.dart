import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://swan.alisonsnewdemo.online/api/login';
   static const String _homeUrl = 'https://swan.alisonsnewdemo.online/api/home';

  Future<Map<String, dynamic>> login(String emailPhone, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl?email_phone=$emailPhone&password=$password'),
    );

    print('Request URL: $_baseUrl');
    print('Request Body: ${jsonEncode({'email_phone': emailPhone, 'password': password})}');
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data with status code ${response.statusCode}');
    }
  }


  Future<Map<String, dynamic>> fetchData(String id, String token) async {

    
    final response = await http.post(
      Uri.parse('$_homeUrl?id=$id&token=$token'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data with status code ${response.statusCode}');
    }
  }
}

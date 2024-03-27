import 'package:dio/dio.dart';
import 'package:wb_test/constants/api.dart';

class ApiClient {
  static const String baseUrl = Api.baseUrl;
  final Dio _dio = Dio();

  Future fetchData() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
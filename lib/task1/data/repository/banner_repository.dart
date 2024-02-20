import 'package:dio/dio.dart';

class BannerRepository {
  Future<List<Map<String, dynamic>>> getBanners() async {
    try {
      final response =
          await Dio().get('https://api.testvalley.kr/main-banner/all');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getMainShortCuts() async {
    try {
      final response =
          await Dio().get('https://api.testvalley.kr/main-shortcut/all');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    try {
      final response =
          await Dio().get('https://api.testvalley.kr/collections?prearrangedDiscount');
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data['items']);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

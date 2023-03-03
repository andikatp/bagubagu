import 'dart:convert';

import 'package:news_app/constants/error_handling.dart';
import 'package:news_app/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  DataService._();

  static const String _apiKey = '31c41c0f81014fc48ec68a5f05ba94f0';

  static Future<List<Articles>> getAllNews() async {
    const String url =
        'https://newsapi.org/v2/everything?q=keyword&apiKey=$_apiKey';
    http.Response response = await http.get(Uri.parse(url));
    try {
      switch (response.statusCode) {
        case 200:
          final decode = jsonDecode(response.body);
          return DataModel.fromJson(decode).articles;
        default:
          throw FetchErrorMessage(
              'Data tidak ditemukan ${response.reasonPhrase}');
      }
    } catch (e) {
      throw FetchErrorMessage('$e');
    }
  }

  static Future<List<Articles>> getNewsCategories(String categories) async {
    const String url =
        'https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$_apiKey';
    http.Response response = await http.get(Uri.parse(url));
    try {
      switch (response.statusCode) {
        case 200:
          final decode = jsonDecode(response.body);
          return DataModel.fromJson(decode).articles;
        default:
          throw FetchErrorMessage(
              'Data tidak ditemukan ${response.reasonPhrase}');
      }
    } catch (e) {
      throw FetchErrorMessage('$e');
    }
  }
}

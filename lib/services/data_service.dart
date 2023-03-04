import 'dart:convert';

import 'package:news_app/constants/error_handling.dart';
import 'package:news_app/models/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  DataService._();

  static const String _apiKey = 'f176499d644c45b89f97e6631cb10de9';

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
      throw FetchErrorMessage('Cek API');
    }
  }

  static Future<List<Articles>> getNewsCategories(String categories) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&category=$categories&apiKey=$_apiKey';
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

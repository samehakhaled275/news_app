import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled6/core/model/NewsResponse.dart';
import 'package:untitled6/core/model/SourcesResponse.dart';

class ApiManger {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '2457d8eda6004f5b9bde5317588cc9f1';

  static Future<SourcesResponse> getSources(String categoryId) async {
//https://newsapi.org
// /v2/top-headlines/sources?
// apiKey=2457d8eda6004f5b9bde5317588cc9f1&category=sports
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });
    var response = await http.get(url);
    // var bodyString = response.body;
    //var json = jsonDecode(bodyString);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceId, String? query}) async {
    //https://newsapi.org/v2/everything?apiKey=2457d8eda6004f5b9bde5317588cc9f1&sources=bbc-sport
    var url = Uri.https(baseUrl, 'v2/everything', {
      'apiKey': apiKey,
      'sources': sourceId,
      'q': query,
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}

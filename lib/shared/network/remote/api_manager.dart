import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c9_monday/models/NewsResponse.dart';
import 'package:news_c9_monday/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(String category) async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "dc3d106e730c4256b8c275d9da58d090",
          "category":category
          });
      http.Response data = await http.get(url);
      var jsonData = jsonDecode(data.body);

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
      return sourcesResponse;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  static Future<NewsResponse> getNews(String source) async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?apiKey=adeec9cc49654e94b646694d29d11ab2&sources=$source');
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json);
    }
    else {
      throw 'error';
    }
  }
}

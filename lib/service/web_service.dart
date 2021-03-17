import 'package:dio/dio.dart';
import 'package:world_news/models/news_article.dart';
import 'package:world_news/utils/constants.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadLinesByCategory(String country, String category) async {
    final response = await dio.get(Constants.headLinesForCategory(country, category));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadLinesByCountry(String country) async {
    final response = await dio.get(Constants.headLinesFor(country));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }

  // Future<List<NewsArticle>> fetchTopHeadLines() async {
  //   final response = await dio.get(Constants.TopHeadLineUrl);
  //   if (response.statusCode == 200) {
  //     final result = response.data;
  //     Iterable list = result['articles'];
  //     return list.map((article) => NewsArticle.fromJson(article)).toList();
  //   } else {
  //     throw Exception("failed to get top news");
  //   }
  // }
}

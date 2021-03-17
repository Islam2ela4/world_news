import 'package:flutter/foundation.dart';
import 'package:world_news/models/news_article.dart';
import 'package:world_news/service/web_service.dart';
import 'package:world_news/view_models/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articlesByCountry = List<NewsArticleViewModel>();
  List<NewsArticleViewModel> articlesByCategory = List<NewsArticleViewModel>();

  void headTopLinesByCategory(String country, String category) async {
    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadLinesByCategory(country, category);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articlesByCategory = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (this.articlesByCategory.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void headTopLinesByCountry(String country) async {
    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadLinesByCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articlesByCountry = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (this.articlesByCountry.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  // void headTopLines() async {
  //   List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
  //   loadingStatus = LoadingStatus.searching;
  //   notifyListeners();
  //   this.articles = newsArticles
  //       .map((article) => NewsArticleViewModel(article: article))
  //       .toList();
  //   if (this.articles.isEmpty) {
  //     this.loadingStatus = LoadingStatus.empty;
  //   } else {
  //     this.loadingStatus = LoadingStatus.completed;
  //   }
  //   notifyListeners();
  // }
}

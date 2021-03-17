import 'package:flutter/material.dart';
import 'package:world_news/screens/news_article_details_screen.dart';
import 'package:world_news/view_models/news_article_view_model.dart';
import 'package:world_news/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  NewsGrid(this.articles);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.articles.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = this.articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(article.imageUrl),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailsScreen(article, 'general');
    }));
  }
}
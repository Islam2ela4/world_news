import 'package:flutter/material.dart';
import 'package:world_news/view_models/news_article_view_model.dart';
import 'package:world_news/widgets/circle_image.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  String category;

  NewsArticleDetailsScreen(this.article, this.category);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/p.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Author',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        this.article.auther ?? 'undefined',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Divider(
                          height: 80,
                          color: Colors.black,
                          thickness: 20,
                        ),
                        Text(
                          ' ${category[0].toUpperCase()}${category.substring(1)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      this.article.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 3,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.article.publishedAt,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      child: CircleImage(
                        this.article.imageUrl,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      this.article.description ?? "No Contents",
                      style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

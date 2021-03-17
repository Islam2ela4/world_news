import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/screens/news_article_details_screen.dart';
import 'package:world_news/view_models/news_article_list_view_model.dart';
import 'package:world_news/widgets/news_tile.dart';

class CategoryNews extends StatefulWidget {
  final String category, country;

  const CategoryNews({Key key, this.category, this.country}) : super(key: key);

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  final String defaultImg = 'http://drums71.ru/wp-content/uploads/2018/02/%d0%9f%d0%98%d0%9b%d0%9e%d0%a2%d0%ab.jpg';

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .headTopLinesByCategory(widget.country, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    var articlesViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('World '),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.description),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articlesViewModel.articlesByCategory.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewsArticleDetailsScreen(
                                articlesViewModel.articlesByCategory[i],
                                widget.category
                              ),
                            ),
                          ),
                          child: NewsTile(
                            imgUrl: articlesViewModel.articlesByCategory[i].imageUrl ?? defaultImg,
                            title: articlesViewModel.articlesByCategory[i].title ?? defaultImg,
                            description: articlesViewModel.articlesByCategory[i].description ?? defaultImg,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

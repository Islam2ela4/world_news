import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/utils/constants.dart';
import 'package:world_news/view_models/news_article_list_view_model.dart';
import 'package:world_news/widgets/category_tile.dart';
import 'package:world_news/widgets/news_grid.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String country = 'us';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .headTopLinesByCountry(country);
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
            onSelected: (value) {
              country = Constants.countries[value];
              listViewModel.headTopLinesByCountry(country);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'World ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'News',
                  style: TextStyle(color: Colors.blue, fontSize: 40),
                ),
              ],
            ),
            Divider(
              height: 40,
              color: Colors.orange,
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Constants.categories().length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: CategoryTile(
                      imgUrl: Constants.categories()[i].imgUrl,
                      categoryName: Constants.categories()[i].categoryName,
                      country: country,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(child: NewsGrid(listViewModel.articlesByCountry))
          ],
        ),
      ),
    );
  }
}

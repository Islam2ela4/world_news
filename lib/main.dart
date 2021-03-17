import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_news/screens/splash.dart';
import 'package:world_news/view_models/news_article_list_view_model.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
      ),
    ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFEFDFD),
        appBarTheme: AppBarTheme(
          color: Color(0xffFEFDFD),
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Splash(),
    );
  }
}

import 'package:world_news/models/category.dart';

class Constants {
  static const API_Key = 'e7f0c333f5d14c07b87dde05b6fc28c0';

  static const String TopHeadLineUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_Key';

  static String headLinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_Key';
  }

  static String headLinesForCategory(String country, String category){
    return 'http://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$API_Key';
  }

  static const Map<String, String> countries = {
    'USA': 'us',
    'Egypt': 'eg',
    'India': 'in',
    'Korea': 'kr',
    'China': 'ch',
    'United Arab Emirates': 'ae',
    'Argentina': 'ar',
    'Australia': 'au',
    'Brazil': 'br',
    'Canada': 'ca',
    'Switzerland': 'ch',
    'Germany': 'de',
    'France': 'fr',
    'United Kingdom': 'gr',
    'Italy': 'it',
    'Japan': 'jp',
    'Morocco': 'ma',
    'Mexico': 'mx',
    'Netherlands': 'nl',
    'Portugal': 'pt',
    'Russia': 'ru',
    'Sweden': 'se',
    'Turkey': 'tr',
  };


  static List<Category> categories() {
    return [
      Category(
        categoryName: 'General',
        imgUrl:
        'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      ),
      Category(
        categoryName: 'Entertainment',
        imgUrl:
        'https://images.unsplash.com/photo-1481328101413-1eef25cc76c0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      ),
      Category(
        categoryName: 'Business',
        imgUrl:
        'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80',
      ),
      Category(
        categoryName: 'Health',
        imgUrl:
        'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
      ),
      Category(
        categoryName: 'Science',
        imgUrl:
        'https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      ),
      Category(
        categoryName: 'Technology',
        imgUrl:
        'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
      ),
      Category(
        categoryName: 'Sports',
        imgUrl:
        'https://images.unsplash.com/photo-1521412644187-c49fa049e84d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
      ),
    ];
  }
}
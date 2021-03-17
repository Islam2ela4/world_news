import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:world_news/screens/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String imgUrl, categoryName, country;

  const CategoryTile({Key key, this.imgUrl, this.categoryName, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName.toLowerCase(),
              country: country,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
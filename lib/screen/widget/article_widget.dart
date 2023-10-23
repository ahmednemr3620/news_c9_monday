import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c9_monday/models/NewsResponse.dart';

class NewsWidget extends StatelessWidget {
  Articles article;
  NewsWidget(this.article);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              child:CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                height: 160, fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),


            ),
            SizedBox(
              height: 5,
            ),
            Text(article.title ?? '',
                maxLines: 2,
                style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis)),
            SizedBox(
              height: 10,
            ),
            Text(article.source?.name ?? ''),
            SizedBox(
              height: 10,
            ),
            Text(
              article.publishedAt ?? '',
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
    ;
  }
}

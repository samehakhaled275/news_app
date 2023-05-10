import 'package:flutter/material.dart';
import 'package:untitled6/core/api/api_manger.dart';
import 'package:untitled6/core/model/NewsResponse.dart';
import 'package:untitled6/core/model/Source.dart';
import 'package:untitled6/view/news/news_item.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
        future: ApiManger.getNews(sourceId: source.id ?? ''),
        builder: (bulidContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data${snapshot.error.toString()}'),
            );
          }
          if (snapshot.data?.status == 'error') {
            return Center(
              child: Text('server error${snapshot.data?.message}'),
            );
          }
          var newsList = snapshot.data?.newsList ?? [];
          return ListView.builder(
            itemBuilder: (_, index) {
              return NewsItem(newsList[index]);
            },
            itemCount: newsList?.length ?? 0,
          );
        },
      ),
    );
  }
}

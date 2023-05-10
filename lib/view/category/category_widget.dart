import 'package:flutter/material.dart';
import 'package:untitled6/core/api/api_manger.dart';
import 'package:untitled6/core/model/SourcesResponse.dart';
import 'package:untitled6/view/category/category_tabs_widget.dart';
import 'package:untitled6/view/home/category_grid_view.dart';

class CategoryNewsList extends StatelessWidget {
  Categroy category;

  CategoryNewsList(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManger.getSources(category.categoryId),
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
          var sources = snapshot.data?.sources;
          return CategoryTabsWidget(sources!);
        },
      ),
    );
  }
}

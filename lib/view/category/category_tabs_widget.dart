import 'package:flutter/material.dart';
import 'package:untitled6/core/model/Source.dart';
import 'package:untitled6/view/category/source_tab_item.dart';
import 'package:untitled6/view/news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => SourceTab(
                      source, widget.sources.indexOf(source) == selectedIndex))
                  .toList(),
              isScrollable: true,
            ),
            Expanded(child: NewsList(widget.sources[selectedIndex])),
          ],
        ),
      ),
    );
  }
}

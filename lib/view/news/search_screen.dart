import 'package:flutter/material.dart';
import 'package:untitled6/core/api/api_manger.dart';
import 'package:untitled6/core/model/NewsResponse.dart';
import 'package:untitled6/view/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<News> newsList = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            leading: SizedBox(),
            leadingWidth: 10,
            title: Container(
              padding: const EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (String? value) {
                  setState(() {
                    query = value!;
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Theme.of(context).primaryColor,
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: "Search Article",
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                  ),
                  contentPadding: EdgeInsets.only(top: 10),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) =>
                NewsItem(search().elementAt(index)),
            itemCount: search().length,
          ),
        ),
      ],
    );
  }

  List search() {
    ApiManger.getNews(query: query).then((newsResponse) {
      newsList = newsResponse.newsList ?? [];
    }).catchError((error) {
      debugPrint('error during call api$error');
    });
    return newsList;
  }
}

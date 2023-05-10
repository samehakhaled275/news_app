import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled6/core/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetalis extends StatelessWidget {
  static const String routeName = "news detalis";

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)!.settings.arguments as News;
    var publishedAt = DateTime.parse(news.publishedAt ?? '');
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
              title: Text('News Title'),
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
            ),
            body: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: news.urlToImage ?? '',
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.author ?? "",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color.fromRGBO(121, 130, 139, 1.0)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.title ?? "",
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${showPublishedAt(news)}',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Color.fromRGBO(163, 163, 163, 1.0)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 1,
                            offset: Offset(1, 2),
                          ),
                        ]),
                    child: Column(
                      children: [
                        Text(
                          news.description ?? '',
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl(Uri.parse(news.url ?? ''));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'view full articale',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(66, 80, 92, 1.0),
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Color.fromRGBO(66, 80, 92, 1.0),
                                  size: 28,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  showPublishedAt(News news) {
    var dateTimeNow = DateTime.now();
    var diffrence = dateTimeNow
        .difference(DateTime.parse(news.publishedAt ?? ''))
        .inMinutes;
    if (diffrence < 0) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inSeconds;
      return '$diffrence seconds ago';
    } else if (diffrence > 0 && diffrence < 60) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$diffrence minutes ago';
    } else if (diffrence > 60 && diffrence < 1440) {
      diffrence = dateTimeNow
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inHours;
      return '$diffrence hours ago';
    } else if (diffrence > 1440 && diffrence < 44640) {
      diffrence =
          dateTimeNow.difference(DateTime.parse(news.publishedAt ?? '')).inDays;
      return '$diffrence days ago';
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(news.publishedAt ?? ''));
    }
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

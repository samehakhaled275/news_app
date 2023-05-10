import 'package:flutter/material.dart';
import 'package:untitled6/core/style/theme.dart';
import 'package:untitled6/view/home/home_view.dart';
import 'package:untitled6/view/news/news_details.dart';
import 'package:untitled6/view/news/search_screen.dart';
import 'package:untitled6/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lighttheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeView.routeName: (context) => HomeView(),
        NewsDetalis.routeName: (context) => NewsDetalis(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
    );
  }
}

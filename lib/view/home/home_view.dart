import 'package:flutter/material.dart';
import 'package:untitled6/view/home/category_grid_view.dart';
import 'package:untitled6/view/news/search_screen.dart';

import '../category/category_widget.dart';

//impor'category_grid_view.dart';
//impo'category/category_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Categroy> category = [
    Categroy(
      categoryId: "Sports",
      categoryImage: "assets/images/sports.png",
      categoryTitle: "Sports",
      categoryBackground: const Color.fromARGB(255, 201, 28, 34),
    ),
    Categroy(
        categoryId: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "General",
        categoryBackground: Color.fromARGB(255, 0, 62, 144)),
    Categroy(
        categoryId: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "Health",
        categoryBackground: Color.fromARGB(255, 237, 30, 121)),
    Categroy(
        categoryId: "business",
        categoryImage: "assets/images/bussines.png",
        categoryTitle: "Business",
        categoryBackground: Color.fromARGB(255, 207, 126, 72)),
    Categroy(
        categoryId: "technology",
        categoryImage: "assets/images/environment.png",
        categoryTitle: "Technology",
        categoryBackground: Color.fromARGB(255, 72, 130, 207)),
    Categroy(
        categoryId: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "Science",
        categoryBackground: Color.fromARGB(255, 242, 211, 82)),
  ];

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
            title: Text(
              selectedCategory == null
                  ? 'News App'
                  : selectedCategory!.categoryTitle,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )),
            actions: [
              selectedCategory != null
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 45),
                  width: double.infinity,
                  height: 110,
                  color: Colors.green,
                  child: Text(
                    'News App!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = null;
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: selectedCategory == null
              ? Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pick your category \nof interest",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.grey),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 6 / 7,
                          ),
                          itemBuilder: (context, index) => CategoryGridView(
                            index: index,
                            categroy: category[index],
                            onClickItem: onClick,
                          ),
                          itemCount: category.length,
                        ),
                      ),
                    ],
                  ),
                )
              : CategoryNewsList(selectedCategory!),
        ),
      ],
    );
  }

  Categroy? selectedCategory = null;

  void onClick(Categroy categroy) {
    setState(() {
      selectedCategory = categroy;
    });
  }
}

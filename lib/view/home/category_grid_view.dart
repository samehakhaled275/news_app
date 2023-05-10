import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  Categroy categroy;
  int index;
  Function onClickItem;

  CategoryGridView(
      {required this.categroy, required this.index, required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickItem(categroy);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: categroy.categoryBackground,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(index % 2 == 0 ? 25 : 0),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categroy.categoryImage),
            Text(
              categroy.categoryTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

class Categroy {
  String categoryId;
  String categoryImage;
  String categoryTitle;
  Color categoryBackground;

  Categroy(
      {required this.categoryId,
      required this.categoryImage,
      required this.categoryTitle,
      required this.categoryBackground});
}

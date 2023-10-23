import 'package:flutter/material.dart';

import '../../models/cat_model.dart';

class CatWidget extends StatelessWidget {
  CategoryModel category;
  int index;
  CatWidget(this.category, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: index.isEven ? Radius.circular(18) : Radius.zero,
            bottomRight: index.isOdd ? Radius.circular(18) : Radius.zero,
          )),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Image.asset(category.img,height: 120),
          SizedBox(
            height: 8,
          ),
          Text(
            category.name,
            style: TextStyle(fontSize: 16,color: Colors.white),
          )
        ],
      ),
    );
  }
}

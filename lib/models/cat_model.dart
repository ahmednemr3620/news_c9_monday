import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String id;
  String img;
  Color color;

  CategoryModel(this.name, this.id, this.img, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel('Business', 'business', 'assets/images/bussines.png',
          Color(0xffC91C22)),
      CategoryModel('entertainment', 'entertainment',
          'assets/images/environment.png', Color(0xff003E90)),
      CategoryModel('general', 'general', 'assets/images/Politics.png',
          Colors.deepOrange),
      CategoryModel(
          'health', 'health', 'assets/images/health.png', Colors.yellow),
      CategoryModel(
          'science', 'science', 'assets/images/science.png', Colors.blueAccent),
      CategoryModel(
          'sports', 'sports', 'assets/images/sports.png', Color(0xff003E90)),
    ];
  }
}

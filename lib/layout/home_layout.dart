import 'package:flutter/material.dart';
import 'package:news_c9_monday/screen/category_screen.dart';
import 'package:news_c9_monday/screen/tab_screen.dart';
import 'package:news_c9_monday/shared/network/remote/api_manager.dart';

import '../models/cat_model.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel?.name??"News App"),
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
        )),
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(categoryModel?.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          var sources = snapshot.data?.sources ?? [];

          return categoryModel == null
              ? CategoryScreen(onCategorySelected)
              : TabsScreen(sources);

        },
      ),
    );
  }

  CategoryModel? categoryModel;

  void onCategorySelected(category) {

    categoryModel = category;

    setState(() {});
  }
}

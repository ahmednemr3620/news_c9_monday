import 'package:flutter/material.dart';
import 'package:news_c9_monday/models/cat_model.dart';
import 'package:news_c9_monday/screen/widget/cat_widget.dart';

class CategoryScreen extends StatelessWidget {
  Function getCategory;

  CategoryScreen(this.getCategory);
  List<CategoryModel> categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const Text(
          'Pick your category of interest',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){

                    getCategory(categories[index]);

                  },
                  child: CatWidget(categories[index], index));
            },
          ),
        )
      ],
    );
  }
}

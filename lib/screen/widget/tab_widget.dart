import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  String name;
  bool isSelcted;
  TabWidget(this.name,this.isSelcted);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      decoration: BoxDecoration(
        color: isSelcted?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green,width: 2)
      ),
      child: Text(name,style: TextStyle(color: isSelcted?Colors.white:Colors.green),),
    );
  }
}

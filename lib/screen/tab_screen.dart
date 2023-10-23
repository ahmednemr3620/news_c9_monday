import 'package:flutter/material.dart';
import 'package:news_c9_monday/screen/widget/article_widget.dart';
import 'package:news_c9_monday/screen/widget/tab_widget.dart';
import 'package:news_c9_monday/shared/network/remote/api_manager.dart';

import '../models/SourcesResponse.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> sources;
  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8,),
          DefaultTabController(
              length: widget.sources.length,
              child: TabBar(
                  isScrollable: true,
                  onTap: (value) {
                    ind = value;
                    setState(() {});
                  },
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources.map((source) {
                    return TabWidget(source.name ?? '',
                        widget.sources.indexOf(source) == ind);
                  }).toList())),
          FutureBuilder(
            future: ApiManager.getNews(widget.sources[ind].id ?? ''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              var data = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsWidget(data[index]);
                    },
                    itemCount: data.length),
              );
            },
          )
        ],
      ),
    );
  }
}

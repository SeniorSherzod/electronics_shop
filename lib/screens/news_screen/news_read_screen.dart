import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/colors.dart';
import '../../utils/styles/styles.dart';
import '../../view_models/news_view_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch news when the screen initializes
    Provider.of<NewsViewModel>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        title:  Text(
          "News",
          style: AppTextStyle.rubikMedium
              .copyWith(fontSize: 25, color: AppColors.white),
        ),
        flexibleSpace:const Padding(
          padding:  EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ],
              ),
            ],
          ),
        ),
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, _) {
          final newsList = newsViewModel.newsList;
          if (newsList.isEmpty) {
            // Show loading indicator or message if news list is empty
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Show news list
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return ListTile(
                  title: Text(newsItem.title),
                  subtitle: Text(newsItem.description),
                  leading: Container(
                    height: 50,
                    width:50,
                    child:Image.network( newsItem.imageUrl,)
                  ),
                  // Add more widgets to display other news details
                );
              },
            );
          }
        },
      ),
    );
  }
}

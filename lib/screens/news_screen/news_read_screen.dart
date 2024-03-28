import 'package:electronics_shop/screens/news_screen/widgets/three_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/colors.dart';
import '../../utils/images/images.dart';
import '../../utils/styles/styles.dart';
import '../../view_models/news_view_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

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
       actions: [
        TextButton(
            onPressed: (){
          Provider.of<NewsViewModel>(context, listen: false).clearNews();
        }, child: Text("clear",style: AppTextStyle.rubikMedium.copyWith(color: AppColors.white,fontSize: 20),))
       ],
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, _) {
          final newsList = newsViewModel.newsList;
          if (newsList.isEmpty) {
            return Center(
                child: Lottie.asset(AppImages.empty)
            );
          } else {
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return ListTile(
                  title: Text(newsItem.title + newsItem.id.toString()),
                  subtitle: Text(newsItem.description),
                  trailing:
                  IconButton(onPressed: (){
                    Provider.of<NewsViewModel>(context, listen: false).removeNews(index);
                  }, icon: Icon(Icons.delete_rounded,color: AppColors.c_f5261a,)),
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

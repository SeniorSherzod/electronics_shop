import 'package:electronics_shop/screens/news_screen/widgets/add_news.dart';
import 'package:electronics_shop/screens/tabs/browse_screen/widgets/three_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/styles/styles.dart';
import '../../data/api_provider/news_apii.dart';

class NewsAddScreen extends StatefulWidget {
  const NewsAddScreen({super.key});

  @override
  State<NewsAddScreen> createState() => _NewsAddScreenState();
}

class _NewsAddScreenState extends State<NewsAddScreen> {
  final searchController = TextEditingController();
  final search = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  text: "send by topic",
                  onPressed: () async {
                    String messageId = await ApiProvider().sendNotificationToUsers(
                      topicName: "news",
                      title: "Bu test notification",
                      body: "Yana test notiifcation",
                    );
                    debugPrint("MESSAGE ID:$messageId");
                  },
                ),
                MyButton(
                  text: "user",
                  onPressed: () {},
                ),
                MyButton(
                  text: "users",
                  onPressed: () {

                  },
                ),
              ],
            ),
            AddNewsBottomSheetContent()
          ],
        ),
      ),
    );
  }
}

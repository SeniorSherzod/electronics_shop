import 'package:electronics_shop/models/category_model.dart';
import 'package:electronics_shop/screens/news_screen/news_add_screen.dart';
import 'package:electronics_shop/screens/news_screen/news_read_screen.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/category_stream_builder.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/product_grid_view.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/universal_search.dart';
import 'widgets/bottom_sheet_add.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../../utils/styles/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: AppTextStyle.rubikMedium.copyWith(
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsScreen()),
                          );
                        },
                        icon: Icon(Icons.article),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsAddScreen()),
                          );
                        },
                        icon: Icon(Icons.article_sharp,color: AppColors.white,),
                      ),
                      IconButton(
                        onPressed: () {
                          showCustomBottomSheet(context,
                          CategoryModel(
                            categoryName:"",
                            imageUrl: "",
                            docId: ""
                          )
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              UniversalSearch(
                prefix: SvgPicture.asset(AppImages.search),
                hintText: "search product",
                onChanged: (value) {},
                onSubmit: (v) {},
                controller: searchController,
                type: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            SizedBox(height: 30.h,),
            SizedBox(
              height: 250.h,
              child:const CategoryStreamBuilder(),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Best Seller",style: AppTextStyle.rubikMedium.copyWith(fontSize: 23,color: AppColors.black),),
                TextButton(onPressed: (){},
                    child: Text("see all"))
              ],
            ),
            const ProductStremBuilder(),
          ],
        ),
      ),
    );
  }
}

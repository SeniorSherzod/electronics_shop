import 'package:electronics_shop/screens/tabs/home_screen/update_screen.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/bottom_sheet.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/utils/images/images.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:electronics_shop/widgets/universal_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../models/category_model.dart';
import '../../../view_models/categoriy_view_model.dart';
import '../../routes.dart';

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
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: AppTextStyle.rubikMedium
                      .copyWith(fontSize: 25, color: AppColors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // context.read<CategoriesViewModel>();
                      },
                      icon: SvgPicture.asset(AppImages.like),
                    ),
                    IconButton(
                      onPressed: () {
                       showCustomBottomSheet(context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            UniversalSearch(
                prefix: SvgPicture.asset(AppImages.search),
                hintText: "search product",
                onChanged: (value) {},
                onSubmit: (v) {},
                controller: searchController,
                type: TextInputType.text)
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 250,
              child: StreamBuilder<List<CategoryModel>>(
                stream: context.read<CategoriesViewModel>().listenCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    List<CategoryModel> list =
                        snapshot.data as List<CategoryModel>;
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          list.length,
                          (index) {
                            CategoryModel category = list[index];
                            return Container(
                              height: 250.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Image.network(
                                        category.imageUrl,
                                        width: 250,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                          "category  ${category.categoryName}"),
                                      Row(
                                        children: [
                                          Text(
                                              "ID raqami ${category.docId.substring(0, 3)}"),
                                          IconButton(
                                            onPressed: () {
                                              context
                                                  .read<CategoriesViewModel>()
                                                  .updateCategory(
                                                CategoryModel(
                                                  imageUrl:
                                                  "https://dnr.wisconsin.gov/sites/default/files/feature-images/ECycle_Promotion_Manufacturers.jpg",
                                                  categoryName: "Electronics",
                                                  docId: category.docId,
                                                ),
                                                context,
                                              );
                                            },
                                            icon: const Icon(Icons.edit),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

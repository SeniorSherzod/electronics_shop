import 'package:electronics_shop/screens/tabs/browse_screen/permissions_screen.dart';
import 'package:electronics_shop/screens/tabs/browse_screen/widgets/product_grid_view.dart';
import 'package:electronics_shop/screens/tabs/browse_screen/widgets/three_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/categoriy_view_model.dart';
import '../../../widgets/universal_search.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
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
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse",
                      style: AppTextStyle.rubikMedium
                          .copyWith(fontSize: 25, color: AppColors.white),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Implement functionality for like button (e.g., navigate to wishlist)
                            // context.read<CategoriesViewModel>(); (Uncomment if needed)
                          },
                          icon: SvgPicture.asset(AppImages.like),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PermissonsScreen(),
                              ),
                            );                          },
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ],
                ),
                UniversalSearch(
                    prefix: SvgPicture.asset(AppImages.search),
                    hintText: "Search product",
                    onChanged: (value) {},
                    onSubmit: (v) {},
                    controller: searchController,
                    type: TextInputType.text),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children:[ Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                      text: "sort by",
                      onPressed: () {},
                    ),
                    MyButton(
                      text: "location",
                      onPressed: () {},
                    ),
                    MyButton(
                      text: "category",
                      onPressed: () {},
                    )
                  ],
                ),
                ]
              ),
              ProductStremBuilder(),
            ],
          ),
        ),
    );
  }
}

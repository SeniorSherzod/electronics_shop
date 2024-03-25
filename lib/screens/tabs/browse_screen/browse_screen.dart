import 'package:electronics_shop/utils/connstants/app_const.dart';
import 'package:electronics_shop/widgets/universal_textfield.dart';
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
  final  searchController=TextEditingController();

  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Browse",style: AppTextStyle.rubikMedium.copyWith(fontSize: 25,color: AppColors.white),),
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
                            context.read<CategoriesViewModel>().insertCategory(
                              CategoryModel(
                                imageUrl:
                                "https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg",
                                categoryName: "Maishiy texnikalar",
                                docId: "",
                              ),
                              context,
                            );
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
                    onChanged: (value){},
                    onSubmit: (v){},
                    controller: searchController,
                    type: TextInputType.text)
              ]),
        ),
      ),
      body: Column(
        children: [
          UniversalTextFormField(
              hintText: "serach",
              onChanged: (value){},
              onSubmit: (v){},
              controller: search,
              errorText: "xato",
              type: TextInputType.name,
              regExp: AppConstants.textRegExp,
              isVisible: false)
        ],
      ),
    );
  }
}

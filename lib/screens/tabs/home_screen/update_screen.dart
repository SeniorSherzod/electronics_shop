import 'package:electronics_shop/screens/tabs/home_screen/widgets/bottom_sheet.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/images/images.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../models/category_model.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../view_models/categoriy_view_model.dart';
import '../../routes.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final nameController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.tabRoute,
                      );
                    },
                    icon: SvgPicture.asset(AppImages.back),
                  ),
                  Text(
                    "Update Categories",
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            UpdateTextfield(
              labelText:"enter category name" ,
              hintText: "enter category name",
              onChanged: (value) {},
              onSubmit: (v) {},
              controller: nameController,
              type: TextInputType.text,
            ),
            UpdateTextfield(
              labelText: "img url",
              hintText: "enter valid  image url",
              onChanged: (value) {},
              onSubmit: (v) {},
              controller: imageController,
              type: TextInputType.text,
            ),
            Row(
              children: [
                UpdateButton(
                    onTap: () {},
                    title: "cancel",
                    horizontalPadding: 16,
                    pixels: 50),
                UpdateButton(
                    onTap: () {
                      showCustomBottomSheet(context);

                    },
                    title: "Dane",
                    horizontalPadding: 16,
                    pixels: 50)
              ],
            )
          ],
        ),
      ),
    );
  }
}

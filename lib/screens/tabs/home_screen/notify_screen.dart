import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/images/images.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../view_models/product_view_model.dart';
import '../../routes.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key, required this.onTap, required this.products});
final VoidCallback onTap;
final List<ProductModel> products;
  final nameController = TextEditingController();

  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        title: Text(
          "Notify Screen",
          style: AppTextStyle.rubikMedium
              .copyWith(fontSize: 25, color: AppColors.white),
        ),
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
            Row(
              children: [
                UpdateButton(
                    onTap: () {},
                    title: "delete by id",
                    horizontalPadding: 16,
                    pixels: 50),
                UpdateButton(
                    onTap: onTap,
                    title: "clear",
                    horizontalPadding: 16,
                    pixels: 50)
              ],
            ),...List.generate(products.length, (index) => ListTile(
              title: Text(products[index].productName),
            ))
          ],
        ),
      ),
    );
  }
}

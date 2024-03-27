import 'package:electronics_shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/extensions/extensions.dart';
import '../../../../utils/styles/styles.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.horizontalPadding,
    this.colors,
    required this.pixels,
    this.colorText,
    this.fontSize,
  });

  final VoidCallback onTap;
  final String title;
  final double horizontalPadding;
  final Color? colors;
  final double pixels;
  final Color? colorText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: width/3,
      height: pixels,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          backgroundColor: AppColors.main,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side:const BorderSide(
            color: AppColors.main, // your color here
            width: 1,
          ),
        ),
        onPressed: onTap,
        child: Text(title,
            style: AppTextStyle.rubikBold
                .copyWith(fontSize: fontSize, color: colorText)),
      ),
    );
  }
}

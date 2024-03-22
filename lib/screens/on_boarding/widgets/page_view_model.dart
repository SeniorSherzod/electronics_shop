import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../models/on_boarding_models/on_boarding_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/styles/styles.dart';

class PageViews extends StatelessWidget {
  const PageViews({super.key, required this.pageViewsModel, required this.horizontalPadding});

  final PageViewsModel pageViewsModel;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageViewsModel.iconPath),
          SizedBox(height: 50.h),
          Text(
            pageViewsModel.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikBold.copyWith(
              fontSize: 24,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            pageViewsModel.subtitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: AppTextStyle.rubikRegular.copyWith(
              fontSize: 16,
              color: AppColors.black.withOpacity(0.45),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
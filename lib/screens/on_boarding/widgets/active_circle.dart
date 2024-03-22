import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../models/on_boarding_models/on_boarding_model.dart';
import '../../../utils/colors/colors.dart';

class BoardingBottomView extends StatelessWidget {
  const BoardingBottomView(
      {super.key,
        required this.pagesData,
        required this.activeIndex,
        required this.onTap});

  final List<PageViewsModel> pagesData;
  final int activeIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ...List.generate(
                  pagesData.length,
                      (index) => Container(
                    margin: const EdgeInsets.all(4),
                    height: 7,
                   width :index == activeIndex?16:7 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: index == activeIndex
                          ? AppColors.c_1A72DD
                          : Colors.grey,
                    ),
                  ))
            ],
          ),
        ],

      ),
    );
  }
}

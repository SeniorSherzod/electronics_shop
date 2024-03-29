import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/view_models/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:provider/provider.dart';

import '../../../../utils/images/images.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({super.key});

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  int _activeIndex = -1;
  final List<String> _icons = [AppImages.home, AppImages.work, AppImages.current];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _icons.length,
            (index) => Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.only(left: 30.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: Colors.white,
              border: _activeIndex == index
                  ? Border.all(
                width: 1.w,
                color: Colors.blue,
              )
                  : null,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15.w),
              onTap: () {
                setState(() {
                  _activeIndex = index;
                  context.read<MapsViewModel>().icons = _icons[index] ;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Image.asset(_icons[index],height: 40.h,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/view_models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../models/places/place_category.dart';
import '../../../../../models/places/place_model.dart';
import '../../../../../utils/images/images.dart';


categoryButtons(
{required ValueChanged<String> image}
    ){
  PlaceModel placeModel=PlaceModel.initialvalue();
  int _activeIndex = 0;
  final List<String> _icons = [
    AppImages.home,
    AppImages.work,
    AppImages.current
  ];

  List<String> titles = [
    "Home",
    "Work",
    "Other",
  ];
  return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _icons.length,
              (index) => Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.w),
                color: _activeIndex == index ? Colors.amber : Colors.white,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(15.w),
                onTap: () {
                  setState(() {
                    _activeIndex = index;
                    context.read<MapViewModel>().icons = _icons[index];
                    placeModel.copywith(placeCategory:PlaceCategory(_icons.toString()));
                  });
                },
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  child: Row(
                    children: [
                      Image.asset(
                        _icons[index],
                        height: 40.h,
                        width: 40.w,
                      ),
                      10.getW(),
                      Text(
                        titles[index],
                        style: TextStyle(
                          color: _activeIndex == index
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 18.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  },

  );
}


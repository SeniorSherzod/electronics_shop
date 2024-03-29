import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors/colors.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/location_view_model.dart';
import '../../../view_models/maps_view_model.dart';
import '../../../widgets/universal_search.dart';
import 'maps_google.dart';

class OrderScreen extends StatelessWidget {
   OrderScreen({super.key});
  final searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<LocationViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order to Map",
                    style: AppTextStyle.rubikMedium.copyWith(
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),

                ],
              ),
              UniversalSearch(
                prefix: SvgPicture.asset(AppImages.search),
                hintText: "search places",
                onChanged: (value) {},
                onSubmit: (v) {},
                controller: searchController,
                type: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            LatLng? latLng = context.read<LocationViewModel>().latLng;
            if (latLng != null) {
              Provider.of<MapsViewModel>(context, listen: false)
                  .setLatInitialLong(latLng);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GoogleMapsScreen();
                  },
                ),
              );
            }
          },
          child: Row(
            children: [
              Text("GOOGLE MAPS OYNASI"),
              SizedBox(
                width: 20,
                  child: Image.asset(AppImages.maps))
            ],
          ),
        ),
      ),
    );
  }
}
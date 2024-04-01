import 'package:electronics_shop/screens/tabs/order_history/yandex/widgets/addrees_dialog.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../models/places/place_category.dart';
import '../../../../models/places/place_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../utils/images/images.dart';
import '../../../../utils/styles/styles.dart';
import '../../../../view_models/adress_view_model.dart';
import '../../../../view_models/maps_viev_model.dart';
import '../../../routes.dart';
import '../widgets/category_select.dart';
import '../widgets/map_items.dart';

class GoogleScreen extends StatefulWidget {
   const GoogleScreen({
    super.key, required this.onTap,
  });

   final VoidCallback onTap;

  @override
  State<GoogleScreen> createState() => _GoogleScreenState();
}

AddressesViewModel addressesViewModel = AddressesViewModel();

class _GoogleScreenState extends State<GoogleScreen> {
  late String image="";
  PlaceModel placeModel=PlaceModel.initialvalue();
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          // if (viewModel.initialCameraPosition != null) {
          //   return const Center(child: CircularProgressIndicator());
          // }
          return Stack(
            children: [
              GoogleMap(
                markers: viewModel.markers,
                onCameraIdle: () {
                  if (cameraPosition != null) {
                    context
                        .read<MapsViewModel>()
                        .changeCurrentLocation(cameraPosition!);
                  }
                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(const SnackBar(content: Text("IDLE")));
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint(
                      "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition,
                onMapCreated: (GoogleMapController createdController) {
                  viewModel.controller.complete(createdController);
                },
              ),

              Positioned(
                top: 60.h,
                left: 20.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNames.tabRoute,
                    );// Ensure navigator is not null before calling pop()
                                    },
                  icon: SvgPicture.asset(
                    AppImages.back,
                    colorFilter:const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                )

              ),
              Align(
                child: Image.asset(
                  AppImages.location,
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                left: 0,
                child: Text(
                  viewModel.currentPlaceName,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.rubikMedium.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              Positioned(
                top: 740,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration:const BoxDecoration(
                    color: AppColors.transparent,
                  ),
                  child: CategorySelect(),
                ),
              )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<MapsViewModel>().moveToInitialPosition();
            },
            child: const Icon(Icons.gps_fixed),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              addressDetailDialog (
                imagePath: image,
                context: context,
                placeModel: (newAddressDetails) {
                  PlaceModel place = newAddressDetails;
                  // place.latLng = cameraPosition!.target;
                  // place.placeCategory = PlaceCategory.work;
                  context.read<AddressesViewModel>().addNewAddress(place,context);
                  // debugPrint(newAddressDetails );
                  widget.onTap.call();
                  Navigator.pop(context);
                },
                viewModel: addressesViewModel,
              );
            },
            child: const Icon(Icons.place),
          ),
          const SizedBox(width: 20),
          const MapTypeItem(),
        ],
      ),
    );
  }
}

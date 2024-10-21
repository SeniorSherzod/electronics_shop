import 'package:electronics_shop/screens/tabs/order_history/widgets/category_select.dart';
import 'package:electronics_shop/screens/tabs/order_history/yandex/widgets/addrees_dialog.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../models/places/place_category.dart';
import '../../../../models/places/place_model.dart';
import '../../../../utils/images/images.dart';
import '../../../../utils/styles/styles.dart';
import '../../../../view_models/adress_view_model.dart';
import '../../../../view_models/maps_viev_model.dart';
import '../widgets/map_items.dart';
import 'google_maps.dart';

class UpdateAddressScreen extends StatefulWidget {
  const UpdateAddressScreen({
    super.key, // Added missing Key parameter
    required this.placeModel, required this.onTap,
  }); // Added missing super call

  final PlaceModel placeModel;
  final VoidCallback onTap;

  @override
  State<UpdateAddressScreen> createState() => _UpdateAddressScreenState();
}

class _UpdateAddressScreenState extends State<UpdateAddressScreen> {
  @override
  void initState() {
    context.read<MapsViewModel>().currentPlaceName =
        widget.placeModel.placeName;

    context.read<MapsViewModel>().setLatInitialLong(widget.placeModel.latLng);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark
        ),
        title: Text("update"),
        backgroundColor: AppColors.main,
      ),
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
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
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint(
                      "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition!,
                onMapCreated: (GoogleMapController createdController) {
                  viewModel.controller.complete(createdController);
                },
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
                top: 630,
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
              addressDetailDialog(
                enterPlace: widget.placeModel.placeName,
                entrance: widget.placeModel.entrance,
                stage: widget.placeModel.stage,
                floor: widget.placeModel.flatNumber,
                description: widget.placeModel.orientAddress,
                context: context,
                placeModel: (newAddressDetails) {

                  PlaceModel place = newAddressDetails;
                  place.latLng = cameraPosition!.target;
                  place.placeCategory = PlaceCategory.work;
                  context.read<AddressesViewModel>().updatePlace(place,context);
                  Navigator.pop(context);
                }, viewModel: addressesViewModel, imagePath: "",
              );
              widget.onTap.call();
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

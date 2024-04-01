import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../models/places/place_category.dart';
import '../../../../../models/places/place_model.dart';
import '../../../../../view_models/adress_view_model.dart';
import '../widgets/update_textfield.dart';

void addressDetailDialog({
  required String imagePath,
  required BuildContext context,
  required AddressesViewModel viewModel,
  required Function(PlaceModel newAddressDetails) placeModel,
}) {
  final TextEditingController placeController = TextEditingController();
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      debugPrint("-------------------------------------------------------$imagePath");
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              UpdateTextfield(
                hintText: "Enter place",
                controller: placeController,
                type: TextInputType.text,
                onChanged: (String value) {},
                onSubmit: (String value) {},
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: UpdateTextfield(
                      hintText: "Entrance",
                      controller: entranceController,
                      type: TextInputType.text,
                      onChanged: (String value) {},
                      onSubmit: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: UpdateTextfield(
                      hintText: "Stage",
                      controller: stageController,
                      type: TextInputType.text,
                      onChanged: (String value) {},
                      onSubmit: (String value) {},
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 130,
                    child: UpdateTextfield(
                      hintText: "Floor",
                      controller: floorController,
                      type: TextInputType.text,
                      onChanged: (String value) {},
                      onSubmit: (String value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              UpdateTextfield(
                hintText: "Description",
                controller: descriptionController,
                type: TextInputType.text,
                onChanged: (String value) {},
                onSubmit: (String value) {},
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                 placeModel.call(PlaceModel(
                    image: imagePath,
                    entrance: entranceController.text,
                    flatNumber: floorController.text,
                    orientAddress: descriptionController.text,
                    placeCategory: PlaceCategory.home,
                    latLng: const LatLng(41, 69),
                    placeName: placeController.text,
                    stage: stageController.text, docId: '',
                  ),);
                  // await viewModel.addNewAddress(placeModel);
                  // placeModel(newAddress);
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.main,
                ),
                child: Text("Save place"),
              )
            ],
          ),
        ),
      );
    },
  );
}

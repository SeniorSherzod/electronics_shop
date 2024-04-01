// import 'package:electronics_shop/screens/news_screen/widgets/three_button.dart';
// import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
// import 'package:electronics_shop/screens/tabs/order_history/widgets/bottom_sheet_button.dart';
// import 'package:electronics_shop/screens/tabs/order_history/widgets/category_select.dart';
// import 'package:electronics_shop/screens/tabs/order_history/widgets/map_items.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import '../../../services/local_notification services.dart';
// import '../../../utils/colors/colors.dart';
// import '../../../utils/images/images.dart';
// import '../../../view_models/map_view_model.dart';
// import '../../../view_models/maps_viev_model.dart';
// import '../../routes.dart';
//
// class GoogleMapsScreen extends StatefulWidget {
//   const GoogleMapsScreen({
//     super.key,
//   });
//
//   @override
//   State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
// }
//
// class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
//   int id = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     CameraPosition? cameraPosition;
//     return Scaffold(
//       body: Consumer<MapsViewModel>(
//         builder: (context, viewModel, child) {
//           if (viewModel.initialCameraPosition == null) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return Stack(
//             children: [
//               GoogleMap(
//                 markers: viewModel.markers,
//                 onCameraIdle: () {
//                   if (cameraPosition != null) {
//                     context
//                         .read<MapsViewModel>()
//                         .changeCurrentLocation(cameraPosition!);
//                     context.read<MapsViewModel>().addNewMarker(icon: '$images', title: 'Home', snippet: 'tashkent');
//                   }
//                   // ScaffoldMessenger.of(context)
//                   //     .showSnackBar(const SnackBar(content: Text("IDLE")));
//                 },
//                 onCameraMove: (CameraPosition currentCameraPosition) {
//                   cameraPosition = currentCameraPosition;
//
//
//                   // LocalNotificationService().showNotification(
//                   //     title:
//                   //         "DIQQAT! ${currentCameraPosition.toString()} nomli mahsulot qo'shildi",
//                   //     body:
//                   //         "Foydalanuvchi cordinatasi${currentCameraPosition.target.latitude} ${currentCameraPosition.target.longitude} ga ozgardi",
//                   //     id: id);
//
//
//                   debugPrint(
//                       "CURRENT POSITION:${currentCameraPosition.target.longitude}");
//                 },
//                 mapType: viewModel.mapType,
//                 initialCameraPosition: viewModel.initialCameraPosition!,
//                 onMapCreated: (GoogleMapController createdController) {
//                   viewModel.controller.complete(createdController);
//                 },
//               ),
//               Align(
//                 child: Image.asset(
//                   AppImages.location,
//                   width: 50,
//                   height: 50,
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(
//                   context,
//                   RouteNames.tabRoute,
//                 );
//               },
//               icon: SvgPicture.asset(
//                 AppImages.back,
//                 color: AppColors.black,
//               )),
//           FloatingActionButton(
//             onPressed: () {
//               context.read<MapsViewModel>().moveToInitialPosition();
//             },
//             child: const Icon(Icons.gps_fixed),
//           ),
//           const SizedBox(width: 20),
//           const MapTypeItem(),
//          IconButton(
//            onPressed: () {
//              showModalBottomSheet<void>(
//                context: context,
//                builder: (BuildContext context) {
//                  return Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
//                      children: [
//                        Text('Select a location'),
//                        UpdateTextfield(
//                          hintText: "Kategoriya nomini kiriting",
//                          onChanged: (v) {},
//                          onSubmit: (value) {},
//                          controller: categoryNameController,
//                          type: TextInputType.text,
//                        ),
//                        SizedBox(height: 16.0),
//                        CategorySelect(),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: [
//                            MyButton(
//                              text: "Cancel",
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                            ),
//                            MyButton(
//                              text: "Done",
//                              onPressed: () {
//                                context.read<MapsViewModel>().addNewMarker();
//                                Navigator.pop(context);
//                              },
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  );
//                },
//              );
//            },
//            icon: SvgPicture.asset(
//              AppImages.store,
//              color: AppColors.black,
//            ),
//          ),
//
//
//         ],
//       ),
//     );
//   }
//
//
// }

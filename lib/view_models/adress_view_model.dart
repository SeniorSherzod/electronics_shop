import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/places/place_model.dart';
import '../utils/connstants/app_const.dart';
import '../utils/utility_functions.dart';

class AddressesViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get getLoader => _isLoading;

  List<PlaceModel> myAddresses = [];

  Future<void> loadAddresses() async {
    _notify(true);
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('addresses').get();
      myAddresses = snapshot.docs
          .map((doc) => PlaceModel.fromJson(doc.data()))
          .toList();
    } catch (error) {
      debugPrint('Error loading addresses: $error');
    }
    _notify(false);
  }

  // Future<void> addNewAddress(PlaceModel placeModel,BuildContext context) async {
  //   try {
  //     _notify(true);
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.addresses)
  //         .add(placeModel.toJson());
  //
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.addresses)
  //         .doc(placeModel.id)
  //         .update(placeModel.toUpdateJson());
  //   loadAddresses();
  //     _notify(false);
  //   } on FirebaseException catch (error) {
  //     if (!context.mounted) return;
  //     showSnackbar(
  //       context: context,
  //       message: error.code,
  //     );
  //     debugPrint(error.message);
  //
  //   }
  // }
  // updatePlace(PlaceModel productModel, BuildContext context) async {
  //   try {
  //     _notify(true);
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.addresses)
  //         .doc(cf.id)
  //         .update(productModel.toUpdateJson());
  //     if (!context.mounted) return;
  //     Navigator.pop(context);
  //
  //     _notify(false);
  //   } on FirebaseException catch (error) {
  //     if (!context.mounted) return;
  //     debugPrint(error.message);
  //   }
  // }
  addNewAddress(
     PlaceModel placeModel,
      BuildContext context,
  ) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.addresses)
          .add(placeModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.addresses)
          .doc(cf.id)
          .update({"doc_id": cf.id});

      _notify(false);
    } on FirebaseException catch (error) {
      return error;
    }
  }

  // Future<void> deleteAddress(String addressId,BuildContext context) async {
  //   try {
  //     _notify(true);
  //     await FirebaseFirestore.instance
  //         .collection(AppConstants.addresses)
  //         .doc(addressId)
  //         .delete();
  //   loadAddresses();
  //     _notify(false);
  //   } on FirebaseException catch (error) {
  //     if (!context.mounted) return;
  //     showSnackbar(
  //       context: context,
  //       message: error.code,
  //     );
  //   }
  // }
  deleteCategory(
      String docId,
      BuildContext context,
      ) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.addresses)
          .doc(docId)
          .delete();

      _notify(false);
    } on FirebaseException catch (error) {
      return error;
    }
  }
  void _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}

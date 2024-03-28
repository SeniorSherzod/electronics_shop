import 'package:electronics_shop/models/product_model.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
import 'package:electronics_shop/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../services/local_notification services.dart';
import '../../../../utils/colors/colors.dart';

void showAddProductCustomBottomSheet(BuildContext context) {
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final docController = TextEditingController();
  final categoryController = TextEditingController();

  // Ensure keyboard doesn't obscure text fields
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);

      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                UpdateTextfield(
                  labelText: "Enter category name",
                  hintText: "Enter category name",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: nameController,
                  type: TextInputType.text,
                ),
                UpdateTextfield(
                  labelText: "Image URL",
                  hintText: "Enter valid image URL",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: imageController,
                  type: TextInputType.text,
                ),
                UpdateTextfield(
                  labelText: "price ",
                  hintText: "Enter price ",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: priceController,
                  type: TextInputType.text,
                ),
                UpdateTextfield(
                  labelText: "description ",
                  hintText: "Enter description",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: descriptionController,
                  type: TextInputType.text,
                ),
                UpdateTextfield(
                  labelText: "doc id",
                  hintText: "Enter doc id ",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: docController,
                  type: TextInputType.text,
                ),
                UpdateTextfield(
                  labelText: " category id",
                  hintText: "Enter category id ",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: categoryController,
                  type: TextInputType.text,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UpdateButton(
                      onTap: () async {
                        final confirmed = await showConfirmationDialog(context);
                        if (confirmed) {
                          Navigator.pop(context); // Close the bottom sheet
                        }
                      },
                      title: "Cancel",
                      colors: AppColors.white,
                      horizontalPadding: 16,
                      pixels: 50,
                    ),
                    UpdateButton(
                      onTap: () {
                        context.read<ProductsViewModel>().insertProducts(
                         ProductModel
                           (storagePath: "",
                             price:priceController.text.length.toDouble(),
                             imageUrl: imageController.text,
                             productName: nameController.text,
                             docId: docController.text,
                             productDescription: descriptionController.text,
                             categoryId: categoryController.text),
                          context,
                        );
                        LocalNotificationService().showNotification(title: "${nameController.text} nomli mahsulot qo'shildi", body: "Bizni mahsulot haqida batafsil malumot olasiz", id: 3);
                        Navigator.pop(context);
                        if (nameController.text.isNotEmpty ) {
                          // Form is valid, perform actions
                          scaffold.showSnackBar(
                            SnackBar(
                              content:const Text('Form submitted successfully!'),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () => scaffold.hideCurrentSnackBar(),
                              ),
                            ),
                          );
                        }

                      },
                      title: "Done",
                      horizontalPadding: 16,
                      pixels: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

}

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:const Text('Are you sure you want to cancel?'),
      content:const Text('This will close the form without saving any changes.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false), // Close dialog and return false
          child:const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true), // Close dialog and return true (cancel)
          child:const Text('Yes'),
        ),
      ],
    ),
  );
}

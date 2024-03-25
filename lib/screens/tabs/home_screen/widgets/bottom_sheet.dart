import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/category_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../view_models/categoriy_view_model.dart';

void showCustomBottomSheet(BuildContext context) {
  final nameController = TextEditingController();
  final imageController = TextEditingController();

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
            height: 300,
            decoration: BoxDecoration(
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
                      horizontalPadding: 16,
                      pixels: 50,
                    ),
                    UpdateButton(
                      onTap: () {
                        context.read<CategoriesViewModel>().insertCategory(
                          CategoryModel(
                            imageUrl:
                            "https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg",
                            categoryName: nameController.text,
                            docId: "",
                          ),
                          context,
                        );
                        Navigator.pop(context);
                        if (nameController.text.isNotEmpty ) {
                          // Form is valid, perform actions
                          scaffold.showSnackBar(
                            SnackBar(
                              content: Text('Form submitted successfully!'),
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
      title: Text('Are you sure you want to cancel?'),
      content: Text('This will close the form without saving any changes.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false), // Close dialog and return false
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true), // Close dialog and return true (cancel)
          child: Text('Yes'),
        ),
      ],
    ),
  );
}

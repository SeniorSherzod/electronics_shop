import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/category_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../view_models/categoriy_view_model.dart';

void showEditCustomBottomSheet(BuildContext context,CategoryModel categoryModel) {
  final nameController = TextEditingController(text: categoryModel.categoryName);
  final imageController = TextEditingController(text: categoryModel.imageUrl);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UpdateButton(
                      onTap: () async {
                        context
                            .read<CategoriesViewModel>()
                            .deleteCategory(categoryModel.docId, context);
                        final confirmed = await showConfirmationDialog(context);
                        if (confirmed) {
                          Navigator.pop(context); // Close the bottom sheet
                        }

                      },
                      title: "Delete",
                      horizontalPadding: 16,
                      pixels: 50,
                    ),
                    UpdateButton(
                      onTap: () {
                        context.read<CategoriesViewModel>().updateCategory(
                          categoryModel,
                          context,
                        );
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
      title:const Text('Are you sure you want to delete?'),
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

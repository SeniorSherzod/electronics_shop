import 'package:image_picker/image_picker.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/category_model.dart';
import '../../../../utils/colors/colors.dart';
import '../../../../view_models/categoriy_view_model.dart';
import '../../../../view_models/image_view_models.dart';

void showCustomBottomSheet(BuildContext context, CategoryModel categoryModel) {
  final nameController = TextEditingController(text: categoryModel.categoryName);
  final imageController = TextEditingController(text: categoryModel.imageUrl);
  final ImagePicker picker = ImagePicker();

  String imageUrl = "";
  String storagePath = "";

  Future<void> _getImageFromCamera() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
        pickedFile: image,
        storagePath: storagePath,
      );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  Future<void> _getImageFromGallery() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
        pickedFile: image,
        storagePath: storagePath,
      );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);

      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: 350,
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
                UpdateButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Choose Image Source"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () async {
                                  await _getImageFromGallery();
                                  Navigator.pop(context);
                                },
                                leading: Icon(Icons.photo_album_outlined),
                                title: Text("Gallereyadan olish"),
                              ),
                              ListTile(
                                onTap: () async {
                                  await _getImageFromCamera();
                                  Navigator.pop(context);
                                },
                                leading: Icon(Icons.camera_alt),
                                title: Text("Kameradan olish"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  title: "Take Image",
                  horizontalPadding: 0,
                  pixels: 45,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UpdateButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: "Cancel",
                      colors: AppColors.white,
                      horizontalPadding: 16,
                      pixels: 50,
                    ),
                    if (context.watch<ImageViewModel>().getLoader)
                      CircularProgressIndicator(),
                    if (imageUrl.isNotEmpty) Image.network(imageUrl),
                    UpdateButton(
                      onTap: () async {
                        if (imageUrl.isNotEmpty &&
                            nameController.text.isNotEmpty) {
                          context.read<CategoriesViewModel>().insertCategory(
                            CategoryModel(
                              storagePath: storagePath,
                              imageUrl:
                              "https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg",
                              categoryName: nameController.text,
                              docId: "",
                            ),
                            context,
                          );
                          Navigator.pop(context);
                          if (nameController.text.isNotEmpty) {
                            // Form is valid, perform actions
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text('Form submitted successfully!'),
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () =>
                                      scaffold.hideCurrentSnackBar(),
                                ),
                              ),
                            );
                          }
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




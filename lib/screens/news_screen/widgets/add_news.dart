import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors/colors.dart';
import 'package:electronics_shop/models/news_model.dart';
import 'package:electronics_shop/view_models/news_view_model.dart';

import '../../../data/api_provider/news_apii.dart';
import '../../tabs/home_screen/widgets/update_button.dart';
import '../../tabs/home_screen/widgets/update_textfield.dart';

class AddNewsBottomSheetContent extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController docController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    String fcmToken = "eQTtVRVeTRC7Lfam5TpnNC:APA91bFNDuCJofBXQRp7b7k35We5InN4HQ9TOopB6whYpHxk5-mbpUSH5iUQW0QH3T2P38ycou1DYh6STyB606Z5Iz7A9djsfglQrLiSIprXr3Aaxq78WKgbvf6UOVQUnrJ9j1qJECR7";
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          height: 600,
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
                labelText: "Enter news name",
                hintText: "Enter news name",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      UpdateButton(
                        onTap: () async {
                          context.read<NewsViewModel>().addNews(
                              News(
                                  title: nameController.text,
                                  description: descriptionController.text,
                                  imageUrl: imageController.text,
                                  date: DateTime.now())
                          );
                          Navigator.pop(context);
                          if (nameController.text.isNotEmpty ) {
                            String messageId = await ApiProvider().sendNotificationToUsers(
                              fcmToken: fcmToken,
                              title: "Bu test notification",
                              body: "Yana test notiifcation",
                            );
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
                        title: "send by topic",
                        colorText: AppColors.white,
                        horizontalPadding: 16,
                        pixels: 50,
                      ),
                      UpdateButton(
                        onTap: () async {
                          context.read<NewsViewModel>().addNews(
                              News(
                                  title: nameController.text,
                                  description: descriptionController.text,
                                  imageUrl: imageController.text,
                                  date: DateTime.now())
                          );
                          Navigator.pop(context);
                          if (nameController.text.isNotEmpty ) {
                            String messageId = await ApiProvider().sendNotificationToUsers(
                              fcmToken: fcmToken,
                              title: "Bu test notification",
                              body: "Yana test notiifcation",
                            );
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
                        title: "user",
                        colorText: AppColors.white,
                        horizontalPadding: 16,
                        pixels: 50,
                      ),
                      UpdateButton(
                        onTap: () async {
                          context.read<NewsViewModel>().addNews(
                              News(
                                  title: nameController.text,
                                  description: descriptionController.text,
                                  imageUrl: imageController.text,
                                  date: DateTime.now())
                          );
                          Navigator.pop(context);
                          if (nameController.text.isNotEmpty ) {
                            String messageId = await ApiProvider().sendNotificationToUsers(
                              fcmToken: fcmToken,
                              title: "Bu test notification",
                              body: "Yana test notiifcation",
                            );
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
                        title: "users",
                        colorText: AppColors.white,
                        horizontalPadding: 16,
                        pixels: 50,
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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

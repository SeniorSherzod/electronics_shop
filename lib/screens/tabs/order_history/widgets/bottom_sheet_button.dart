import 'package:electronics_shop/screens/tabs/order_history/widgets/category_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/images/images.dart';
import '../../../news_screen/widgets/three_button.dart';
import '../../../routes.dart';
import '../../home_screen/widgets/update_textfield.dart';

class BottomSheetButton extends StatefulWidget {
   BottomSheetButton({super.key});


  @override
  State<BottomSheetButton> createState() => _BottomSheetButtonState();
}
List<String> images = [
  AppImages.home,
  AppImages.work,
  AppImages.current,
];

int _activeIndex = -1;
final TextEditingController categoryNameController = TextEditingController();

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Text('Select a location'),
                    UpdateTextfield(
                      hintText: "Kategoriya nomini kiriting",
                      onChanged: (v) {},
                      onSubmit: (value) {},
                      controller: categoryNameController,
                      type: TextInputType.text,
                    ),
                    SizedBox(height: 16.0),
                   CategorySelect(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          text: "Cancel",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MyButton(
                          text: "Done",
                          onPressed: () {
                            // Implement your logic here
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: SvgPicture.asset(
          AppImages.store,
          color: AppColors.black,
        ),
      ),
    );
  }
}

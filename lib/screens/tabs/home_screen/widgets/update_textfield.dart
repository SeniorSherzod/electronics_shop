
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/colors/colors.dart';
import '../../../../utils/styles/styles.dart';


class UpdateTextfield extends StatelessWidget {
  const UpdateTextfield({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.onSubmit,
    this.keyboardType,
    this.prefix,
    required this.controller,
    required this.type,
    this.labelText,
    this.suffix,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final Function(String value) onChanged;
  final Function(String v) onSubmit;
  final SvgPicture? prefix;
  final SvgPicture? suffix;
  final TextEditingController controller;
  final TextInputType type;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 80,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              onChanged: onChanged,
              decoration: InputDecoration(
                fillColor: AppColors.main,
                filled: true,
                hintText: hintText,
                suffix: suffix,
                prefixIcon: prefix,
                prefixIconConstraints: BoxConstraints(minWidth: 60.w),
                helperStyle: AppTextStyle.rubikMedium.copyWith(
                  color: AppColors.c_2A3256,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                errorStyle: TextStyle(color: Colors.red),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                // Adding shadow to the bottom
              ),
            ),
          ),
        )
      ],
    );
  }
}

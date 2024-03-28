import 'package:electronics_shop/screens/tabs/home_screen/widgets/show_edit_bottom_sheet.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../models/category_model.dart';
import '../../../../view_models/categoriy_view_model.dart';

class CategoryStreamBuilder extends StatelessWidget {
  CategoryStreamBuilder({super.key});
  final ImagePicker picker = ImagePicker();

  String imageUrl = "";
  String storagePath = "";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryModel>>(
      stream: context.read<CategoriesViewModel>().listenCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          List<CategoryModel> list = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              CategoryModel category = list[index];
              return InkWell(
                onTap: (){

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.main.withOpacity(0.5)
                  ),
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              category.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Category: ${category.categoryName}",
                          style: AppTextStyle.rubikMedium,
                        ),
                        SizedBox(height: 4.h),
                        Text("ID: ${category.docId}"),
                        IconButton(
                          onPressed: () {
                            showEditCustomBottomSheet(context,
                            CategoryModel(
                              storagePath:storagePath ,
                                imageUrl: category.imageUrl,
                                categoryName:category.categoryName,
                                docId: category.docId));
                            // context
                            //     .read<CategoriesViewModel>()
                            //     .updateCategory(
                            //   CategoryModel(
                            //     imageUrl:
                            //     "https://dnr.wisconsin.gov/sites/default/files/feature-images/ECycle_Promotion_Manufacturers.jpg",
                            //     categoryName: "Electronics",
                            //     docId: category.docId,
                            //   ),
                            //   context,
                            // );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

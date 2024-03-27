import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/product_model.dart';
import '../../../../view_models/product_view_model.dart';

class ProductStremBuilder extends StatelessWidget {
  const ProductStremBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductModel>>(
      stream: context.read<ProductsViewModel>().listenProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          List<ProductModel> list = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            physics:const  NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              ProductModel product = list[index];
              return InkWell(
                onTap: () {
                  // Handle product tap
                },
                child: Card(
                  elevation: 20,
                  color: AppColors.c_E3562A,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              product.productName,
                              style:AppTextStyle.rubikMedium
                            ),
                            IconButton(onPressed: (){
                              context.read<ProductsViewModel>().clearAllNotification();
                            }, icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ],
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

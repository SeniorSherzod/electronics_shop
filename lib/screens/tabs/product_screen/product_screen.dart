import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/categoriy_view_model.dart';
import '../../../view_models/product_view_model.dart';
import '../../../widgets/universal_search.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  final  searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Products",style: AppTextStyle.rubikMedium.copyWith(fontSize: 25,color: AppColors.white),),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // context.read<CategoriesViewModel>();
                          },
                          icon: SvgPicture.asset(AppImages.like),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CategoriesViewModel>().insertCategory(
                              CategoryModel(
                                imageUrl:
                                "https://static-assets.business.amazon.com/assets/in/24th-jan/705_Website_Blog_Appliances_1450x664.jpg.transform/1450x664/image.jpg",
                                categoryName: "Maishiy texnikalar",
                                docId: "",
                              ),
                              context,
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
                UniversalSearch(
                    prefix: SvgPicture.asset(AppImages.search),
                    hintText: "search product",
                    onChanged: (value){},
                    onSubmit: (v){},
                    controller: searchController,
                    type: TextInputType.text)
              ]),
        ),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsViewModel>().listenProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> list = snapshot.data as List<ProductModel>;
            return ListView(
              children: [
                ...List.generate(
                  list.length,
                      (index) {
                    ProductModel product = list[index];
                    return ListTile(
                      leading: Image.network(
                        product.imageUrl,
                        width: 50,
                      ),
                      title: Text(product.productName),
                      subtitle: Text(product.docId),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ProductsViewModel>()
                                    .deleteProduct(product.docId, context);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<ProductsViewModel>().updateProduct(
                                  ProductModel(
                                    price: product.price,
                                    imageUrl:
                                    "https://upload.wikimedia.org/wikipedia/commons/2/2c/NOKIA_1280.jpg",
                                    productName: "Galaxy",
                                    docId: product.docId,
                                    productDescription: "",
                                    categoryId: product.categoryId,
                                  ),
                                  context,
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
// IconButton(
// onPressed: () {
// context.read<ProductsViewModel>().insertProducts(
// ProductModel(
// price: 12.5,
// imageUrl:
// "https://i.ebayimg.com/images/g/IUMAAOSwZGBkTR-K/s-l400.png",
// productName: "Nokia 12 80",
// docId: "",
// productDescription: "productDescription",
// categoryId: "kcggCJzOEz7gH1LQy44x",
// ),
// context,
// );
// },
// icon: const Icon(Icons.add),
// ),
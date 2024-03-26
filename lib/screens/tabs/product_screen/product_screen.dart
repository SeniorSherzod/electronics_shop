import 'package:electronics_shop/screens/tabs/home_screen/widgets/product_grid_view.dart';
import 'package:electronics_shop/screens/tabs/product_screen/widgets/add_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/product_view_model.dart';
import '../../../widgets/universal_search.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 120,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: AppTextStyle.rubikMedium.copyWith(
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle like button tap
                        },
                        icon: SvgPicture.asset(AppImages.like),
                      ),
                      IconButton(
                        onPressed: () {
                          showAddProductCustomBottomSheet(
                            context,);
                          // context.read<ProductsViewModel>().insertProducts(
                          //   ProductModel(
                          //     price: 12.5,
                          //     imageUrl:
                          //     "https://freebiehive.com/wp-content/uploads/2023/09/Apple-IPhone-15-White-Titanium-PNG-728x409.jpg",
                          //     productName: "I phone 15",
                          //     docId: "",
                          //     productDescription: "productDescription",
                          //     categoryId: "kcggCJzOEz7gH1LQy44x",
                          //   ),
                          //   context,
                          // );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              UniversalSearch(
                prefix: SvgPicture.asset(AppImages.search),
                hintText: "search product",
                onChanged: (value) {},
                onSubmit: (v) {},
                controller: searchController,
                type: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      body:const SingleChildScrollView(
          child: ProductStremBuilder())
    );
  }
}

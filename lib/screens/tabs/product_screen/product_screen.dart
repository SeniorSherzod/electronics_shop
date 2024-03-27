import 'package:electronics_shop/screens/tabs/home_screen/notify_screen.dart';
import 'package:electronics_shop/screens/tabs/home_screen/widgets/product_grid_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../models/product_model.dart';
import '../../../services/local_notification services.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/images/images.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/product_view_model.dart';
import '../../../widgets/universal_search.dart';
import '../../routes.dart';

Future<void> onBackgroundFCM(RemoteMessage message) async {
  debugPrint(
      "BACKGROUND MODE DA PUSH NOTIFICATION KELDI:${message.notification!.title}");
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final searchController = TextEditingController();
  List<int> activeNotification = [];
  List<ProductModel> products = [];
  int tempId = 0;

  _init() async {
    FirebaseMessaging.instance.subscribeToTopic("news");

    FirebaseMessaging.instance.unsubscribeFromTopic("news");

    String? fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN:$fcmToken");

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification != null) {
        LocalNotificationService.localNotificationService.showNotification(
          title: remoteMessage.notification!.title!,
          body: remoteMessage.notification!.body!,
          id: tempId,
        );
      }
      debugPrint(
          "FOREGROUND MODE DA PUSH NOTIFICATION KELDI:${remoteMessage.notification!.title}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.notification != null) {
        debugPrint(
            "TERMINATED MODE DA PUSH NOTIFICATION KELDI:${remoteMessage.notification!.title}");
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
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
                          context
                              .read<ProductsViewModel>()
                              .clearAllNotification();
                          setState(() {
                            products = [];
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    ...products.map(
                                          (product) => ListTile(
                                        title: Text(product.productName),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.notification_add_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ProductsViewModel>().insertProducts(
                            ProductModel(
                              price: 12.5,
                              imageUrl:
                              "https://w7.pngwing.com/pngs/961/642/png-transparent-iphone-14-pro-thumbnail.png",
                              productName: "I phone 14",
                              docId: "",
                              productDescription: "productDescription",
                              categoryId: "kcggCJzOEz7gH1LQy44x",
                            ),
                            context,
                          );
                          setState(() {
                            products.add(
                              ProductModel(
                                price: 12.5,
                                imageUrl:
                                "https://w7.pngwing.com/pngs/961/642/png-transparent-iphone-14-pro-thumbnail.png",
                                productName: "I phone 14",
                                docId: "",
                                productDescription: "productDescription",
                                categoryId: "kcggCJzOEz7gH1LQy44x",
                              ),
                            );
                          });
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
        body: const SingleChildScrollView(child: ProductStremBuilder())
    );
  }
}

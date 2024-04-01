import 'package:electronics_shop/screens/tabs/home_screen/widgets/update_button.dart';
import 'package:electronics_shop/screens/tabs/order_history/yandex/google_maps.dart';
import 'package:electronics_shop/screens/tabs/order_history/yandex/update_address.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../utils/images/images.dart';
import '../../../view_models/adress_view_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.main,
        title: const Text("My Addresses"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.myAddresses.isEmpty) {
                  return Center(
                    child: Lottie.asset(AppImages.empty),
                  );
                }
                return ListView(children: [
                  ...List.generate(viewModel.myAddresses.length, (index) {
                    var myAddress = viewModel.myAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateAddressScreen(
                                placeModel: myAddress,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                            title: Text(myAddress.placeName),
                            subtitle: Text(myAddress.orientAddress),
                            trailing: IconButton(
                              onPressed: () async{
                                await context
                                    .read<AddressesViewModel>()
                                    .deleteCategory(myAddress.docId, context);
                                if(!context.mounted) return;
                                context.read<AddressesViewModel>().loadAddresses();
                              },
                              icon: Icon(
                                Icons.cancel_outlined,
                              ),
                            )),
                      ),
                    );
                  })
                ]);
              },
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          UpdateButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GoogleScreen(
                      onTap: () {
                        context.read<AddressesViewModel>().loadAddresses();
                      },
                    );
                  },
                ),
              );
            },
            title: "Yangi address qo'shish",
            horizontalPadding: 20,
            pixels: 50,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
      //
    );
  }
}

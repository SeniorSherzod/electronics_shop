import 'package:electronics_shop/screens/tabs/product_screen/product_screen.dart';
import 'package:electronics_shop/screens/tabs/profile_screen/profile_screen.dart';
import 'package:electronics_shop/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';
import '../../utils/images/images.dart';
import '../../view_models/tab_view_model.dart';
import 'browse_screen/browse_screen.dart';
import 'home_screen/home_screen.dart';
import 'order_history/order_history.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> screens = [
    HomeScreen(),
    BrowseScreen(),
    ProductsScreen(),
    // OrderHistory(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<TabViewModel>().getIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        selectedLabelStyle: AppTextStyle.rubikMedium,
        currentIndex: context.watch<TabViewModel>().getIndex,
        onTap: (newIndex) {
          context.read<TabViewModel>().changeIndex(newIndex);
        },
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.home),
            label: "Home",
            activeIcon: SvgPicture.asset(AppImages.home,color: AppColors.main,),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.search),
            label: "Browse",
            activeIcon: SvgPicture.asset(AppImages.search,color: AppColors.main,),
          ), BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.store),
            label: "Store",
            activeIcon: SvgPicture.asset(AppImages.store,color: AppColors.main,),
          ),
          // BottomNavigationBarItem(
          //   icon:SvgPicture.asset(AppImages.order),
          //   label: "Order history",
          //   activeIcon: SvgPicture.asset(AppImages.order,color: AppColors.main,),
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppImages.profile),
            label: "Profile",
            activeIcon:SvgPicture.asset(AppImages.profile,color: AppColors.main,),
          )
        ],
      ),
    );
  }
}

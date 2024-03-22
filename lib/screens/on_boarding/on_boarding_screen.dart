import 'package:electronics_shop/screens/on_boarding/widgets/active_circle.dart';
import 'package:electronics_shop/screens/on_boarding/widgets/page_view_model.dart';
import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/on_boarding_models/on_boarding_model.dart';
import '../../utils/colors/colors.dart';
import '../../utils/images/images.dart';
import '../../utils/styles/styles.dart';
import '../../widgets/global_button.dart';
import '../login_screen/login_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageViewsModel> pagesData = [
    PageViewsModel(
      iconPath: AppImages.img_2,
      title: "Best app for Shopping",
      subtitle:
      "You can find everything what you need easily",
    ),
    PageViewsModel(
      iconPath: AppImages.img_3,
      title: "Easy Connection",
      subtitle:
      "Connecting NGOs, Social Enterprises with Communities",
    ),
    PageViewsModel(
      iconPath: AppImages.img_4,
      title: "Finance",
      subtitle:
      " Donate, Invest & Support infrastructure projects",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.transparent
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          actions: [TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "SKIP",
              style: AppTextStyle.rubikRegular.copyWith(
                  fontSize: 14, color: AppColors.black.withOpacity(0.45)),
            ),
          ),],),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  ...List.generate(
                    pagesData.length,
                        (index) => PageViews(
                      pageViewsModel: pagesData[index],
                      horizontalPadding: index == 0 ? 70.w : 55.w,
                    ),
                  )
                ],
              ),
            ),
            BoardingBottomView(
              pagesData: pagesData,
              activeIndex: activeIndex,
              onTap: () {
              },
            ),
            SizedBox(height: 20.h),
            GlobalButton(onTap: (){ if (activeIndex < pagesData.length - 1) {
              setState(() {
                activeIndex++;
              });
              pageController.jumpToPage(activeIndex);
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            }},
              pixels: 53,
              colors: AppColors.c_E3562A,
              title: activeIndex == pagesData.length-1 ? "Finish":"Next",
              horizontalPadding: 22.w),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}


import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors/colors.dart';
import '../../../utils/styles/styles.dart';
import '../../../view_models/sign_up_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<LoginViewModel>().getUser;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: AppColors.main,
        toolbarHeight: 200,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profiles",
                    style: AppTextStyle.rubikMedium.copyWith(
                      fontSize: 25,
                      color: AppColors.white,
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
                    width: 85.w,
                    height: 85.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50), // Set clip radius here too
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.network(
                            user!.photoURL.toString(),
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  user != null
                      ? context.watch<LoginViewModel>().loading
                      ? const Center(child: CircularProgressIndicator())
                      : Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName.toString(),
                              style:
                              AppTextStyle.rubikMedium.copyWith(fontSize: 15,color: AppColors.white),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              user.email.toString(),
                              style:
                              AppTextStyle.rubikMedium.copyWith(fontSize: 15,color: AppColors.white),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              user.uid.toString().substring(3),
                              style:
                              AppTextStyle.rubikMedium.copyWith(fontSize: 15,color: AppColors.white),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                      : const Center(
                    child: Text("USER NOT EXIST"),
                  ),
                ],
              ),

            ],
          ),
        ),
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: (){},
              child: const Text('Language '),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: (){},
              child: const Text('Feedback'),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: (){},
              child: const Text('Terms & Conditions'),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            TextButton(
              onPressed: (){
                context.read<LoginViewModel>().logout(context);
              },
              child: Text("Log out"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
      );
  }
}

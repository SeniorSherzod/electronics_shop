import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        elevation: 0,
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginViewModel>().logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: user != null
          ? context.watch<LoginViewModel>().loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  user.uid,
                  style: AppTextStyle.rubikMedium
                      .copyWith(fontSize: 24),
                ),
                SizedBox(height: 12.h),
                Text(
                  user.email.toString(),
                  style: AppTextStyle.rubikMedium
                      .copyWith(fontSize: 24),
                ),
                SizedBox(height: 12.h),
                Text(
                  user.displayName.toString(),
                  style: AppTextStyle.rubikMedium
                      .copyWith(fontSize: 24),
                ),
                if (user.photoURL != null)
                  Image.network(
                    user.photoURL!,
                    width: 200,
                    height: 200,
                  ),
                IconButton(
                  onPressed: () {
                    context.read<LoginViewModel>().updateImageUrl(
                        "https://www.tenforums.com/attachments/tutorials/146359d1501443008-change-default-account-picture-windows-10-a-user.png");
                  },
                  icon: const Icon(Icons.image),
                )
              ],
            ),
          ),
        ),
      )
          : const Center(
        child: Text("USER NOT EXIST"),
      ),
    );
  }
}

import 'package:electronics_shop/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../utils/colors/colors.dart';
import '../../utils/connstants/app_const.dart';
import '../../utils/images/images.dart';
import '../../utils/styles/styles.dart';
import '../../view_models/sign_up_view.dart';
import '../../widgets/global_button.dart';
import '../../widgets/universal_textfield.dart';
import '../login_screen/login_screen.dart';
import '../tabs/profile_screen/profile_screen.dart';
import '../tabs/tab_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();


  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;
  bool nameVisibility = false;
  bool emailVisibility = false;
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.transparent
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body:context.watch<LoginViewModel>().loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: EdgeInsets.only(top: 56),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                          padding: EdgeInsets.zero,
                          icon: SvgPicture.asset(AppImages.back),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: Image.asset(AppImages.img_1)),
                SizedBox(height: 50),
                Text(
                  "Sign up",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.rubikBold.copyWith(
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: Text(
                    "Create your account",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.rubikRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                UniversalTextFormField(
                  hintText: "Name",
                  onChanged:(value){},
                  onSubmit: (v){},
                  controller: usernameController,
                  errorText: 'Ismda xatolik bor',
                  type: TextInputType.text,
                  regExp: AppConstants.textRegExp, isVisible: nameVisibility, onSuffixTap: () {
                  setState(() {
                    nameVisibility = !nameVisibility; // Toggle visibility
                  });
                },),
                SizedBox(height: 10),
                UniversalTextFormField(
                  prefix: SvgPicture.asset(AppImages.emails),
                  hintText: "Email",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: emailController,
                  errorText: 'Email is invalid',
                  type: TextInputType.text,
                  regExp: AppConstants.emailRegExp,
                  isVisible: emailVisibility, // Bind visibility state
                  onSuffixTap: () {
                    setState(() {
                      emailVisibility = !emailVisibility; // Toggle visibility
                    });
                  },
                ),
                SizedBox(height: 10),
                UniversalTextFormField(
                  prefix: SvgPicture.asset(AppImages.password),
                  hintText: "Password",
                  onChanged: (value) {},
                  onSubmit: (v) {},
                  controller: passwordController,
                  errorText: 'Password is invalid',
                  type: TextInputType.text,
                  regExp: AppConstants.passwordRegExp,
                  isVisible: passwordVisibility, // Bind visibility state
                  onSuffixTap: () {
                    setState(() {
                      passwordVisibility = !passwordVisibility; // Toggle visibility
                    });
                  },
                ),
                SizedBox(height: 10),
                GlobalButton(onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TabScreen();
                      },
                    ),
                  );

                  bool validated = formKey.currentState!.validate();
                  context.read<LoginViewModel>().registerUser(
                    context,
                    email: emailController.text,
                    password: passwordController.text,
                    username: usernameController.text,
                  );
                  if (validated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("SUCCESS!")));
                  }
                },
                  pixels: 53,
                  colors: AppColors.c_E3562A,
                  title: "Sign up",
                  horizontalPadding: 22.w),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: AppTextStyle.rubikRegular.copyWith(
                        fontSize: 14, color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
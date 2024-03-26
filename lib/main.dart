import 'package:electronics_shop/screens/routes.dart';
import 'package:electronics_shop/services/local_notification%20services.dart';
import 'package:electronics_shop/utils/colors/colors.dart';
import 'package:electronics_shop/view_models/categoriy_view_model.dart';
import 'package:electronics_shop/view_models/product_view_model.dart';
import 'package:electronics_shop/view_models/sign_up_view.dart';
import 'package:electronics_shop/view_models/tab_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureLocalTimeZone();
  await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ChangeNotifierProvider(create: (_) => TabViewModel()),
      ChangeNotifierProvider(create: (_) => CategoriesViewModel()),
      ChangeNotifierProvider(create: (_) => ProductsViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.white
      ),
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

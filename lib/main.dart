import 'package:bulk_app/core/routing/app_router.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BulkApp(
    appRouter: AppRouter(),
  ));
}

class BulkApp extends StatelessWidget {
  final AppRouter appRouter;

  const BulkApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Bulk App',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManager.darkBackGround,
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}

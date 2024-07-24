import 'package:bulk_app/core/helpers/language.dart';
import 'package:bulk_app/core/routing/app_router.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(EasyLocalization(
    supportedLocales: const [englishLocale],
    path: assetPathLocalization,
    child: BulkApp(
      appRouter: AppRouter(),
    ),
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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Bulk App',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorsManager.darkBackGround,
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
          initialRoute: Routes.addTemplateScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}

import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/constants.dart';
import 'package:bulk_app/core/routing/app_router.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/theming/colors.dart';
import 'package:bulk_app/features/shared/logic/cubit/shared_controller_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulkApp extends StatelessWidget {
  final AppRouter appRouter;
  const BulkApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocProvider(
          create: (context) => getIt<SharedControllerCubit>()
            ..emitgetAllAccountsStates()
            ..emitSubscribeAccountSSEStates(
                "22cf67e5-5322-4dcd-afcc-225c555dba1f"),
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Bulk App',
            theme: ThemeData(
              scaffoldBackgroundColor: ColorsManager.darkBackGround,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute:
                isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
            // initialRoute: Routes.loginScreen,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ));
  }
}

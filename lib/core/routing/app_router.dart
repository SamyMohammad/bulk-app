import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/features/home/ui/pages/home_screen.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/pages/manage_audiances_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../features/home/logic/cubit/home_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnboardingScreen(),
      //   );
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignupCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
             case Routes.manageAudiances:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ManageAudiancesCubit(),
            child: const ManageAudiancesScreen(),
          ),
        );
      default:
        return null;
    }
  }
}

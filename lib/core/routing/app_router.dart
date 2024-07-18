import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/features/home/ui/pages/home_screen.dart';
import 'package:bulk_app/features/manage_audiances/presentation/cubits/manage_templates_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/presentation/pages/manage_audiances_screen.dart';
import 'package:bulk_app/features/templates/presentation/cubit/add_template_cubit/add_template_cubit.dart';
import 'package:bulk_app/features/templates/presentation/cubit/templates/templates_cubit.dart';
import 'package:bulk_app/features/templates/presentation/pages/add_template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/templates/presentation/pages/templates_screen.dart';

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
              case Routes.templatesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TemplatesCubit(),
            child: const TemplatesScreen(),
          ),
        );
            case Routes.addTemplateScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddTemplateCubit(),
            child: const AddTemplatesScreen(),
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

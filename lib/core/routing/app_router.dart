import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/routing/routes.dart';
import 'package:bulk_app/core/test/simulate_account.dart';
import 'package:bulk_app/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:bulk_app/features/auth/ui/screen/login_screen.dart';
import 'package:bulk_app/features/auth/ui/screen/register_screen.dart';
import 'package:bulk_app/features/home/ui/screens/home_screen.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_audience_cubit/manage_audiances_cubit.dart';
import 'package:bulk_app/features/manage_audiances/logic/manage_contact_cubit/contact_screen_cubit.dart';
import 'package:bulk_app/features/manage_audiances/ui/screens/contact_screen.dart';
import 'package:bulk_app/features/manage_audiances/ui/screens/manage_audiances_screen.dart';
import 'package:bulk_app/features/shared/logic/cubit/shared_controller_cubit.dart';
import 'package:bulk_app/features/support/screens/support_screen.dart';
import 'package:bulk_app/features/templates/logic/add_template_cubit/add_template_cubit.dart';
import 'package:bulk_app/features/templates/logic/templates_cubit/templates_cubit.dart';
import 'package:bulk_app/features/templates/ui/screens/add_template_screen.dart';
import 'package:bulk_app/features/whats_bots/logic/cubit/whatsbots_cubit.dart';
import 'package:bulk_app/features/whats_bots/ui/screens/whats_bots_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/start_campains/logic/start_campagin_cubit.dart';
import '../../features/start_campains/ui/screens/start_campagin_screen.dart';
import '../../features/templates/ui/screens/templates_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.startCampaginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<StartCampaginCubit>(),
                  child: const StartCampaginScreen(),
                ),
            settings: settings);
      case Routes.homeScreen:
        return PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.elasticIn;

            var tween = Tween(begin: begin, end: end).chain(
                CurveTween(curve: const Interval(0.1, 1.0, curve: curve)));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(create: (context) => getIt<SharedControllerCubit>()),
              BlocProvider(create: (context) => getIt<MockAccountCubit>()),
            ],

            // create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.templatesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<TemplatesCubit>()..emitGetAllTemplatesStates(),
            child: const TemplatesScreen(),
          ),
        );
      case Routes.addTemplateScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AddTemplateCubit>(),
            child: const AddTemplatesScreen(
              isEdit: false,
            ),
          ),
          settings: RouteSettings(arguments: arguments),
        );
      case Routes.manageAudiances:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<ManageAudiancesCubit>()..fetchAudienceList(),
            child: const ManageAudiancesScreen(),
          ),
        );
      case Routes.conatctScreen:
        final args = settings.arguments as Arguments;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ContactScreenCubit>(),
            child: const ContactScreen(),
          ),
          settings: RouteSettings(arguments: args),
        );
      case Routes.whatsBotsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<WhatsbotsCubit>(),
            child: const WhatsBotsScreen(),
          ),
        );
      case Routes.supportScreen:
        return MaterialPageRoute(
          builder: (_) => const SupportScreen(),
        );

      default:
        return null;
    }
  }
}

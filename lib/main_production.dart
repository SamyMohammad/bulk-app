import 'package:bulk_app/core/bulk_app.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/bloc_observer.dart';
import 'package:bulk_app/core/helpers/language.dart';
import 'package:bulk_app/core/routing/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  Bloc.observer = CustomBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupGetIt();
  runApp(EasyLocalization(
    supportedLocales: const [englishLocale],
    path: assetPathLocalization,
    child: BulkApp(
      appRouter: AppRouter(),
    ),
  ));
}

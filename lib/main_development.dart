import 'package:bulk_app/core/bulk_app.dart';
import 'package:bulk_app/core/di/dependency_injection.dart';
import 'package:bulk_app/core/helpers/bloc_observer.dart';
import 'package:bulk_app/core/helpers/constants.dart';
import 'package:bulk_app/core/helpers/extensions.dart';
import 'package:bulk_app/core/helpers/language.dart';
import 'package:bulk_app/core/helpers/shared_pref_helper.dart';
import 'package:bulk_app/core/routing/app_router.dart';
import 'package:bulk_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await checkIfLoggedInUser();

  setupGetIt();

  Bloc.observer = CustomBlocObserver();

  runApp(EasyLocalization(
    supportedLocales: const [englishLocale],
    path: assetPathLocalization,
    child: BulkApp(
      appRouter: AppRouter(),
    ),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

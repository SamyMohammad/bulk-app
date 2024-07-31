import 'package:bulk_app/core/helpers/media.dart';
import 'package:bulk_app/core/networking/api_service.dart';
import 'package:bulk_app/core/networking/dio_factory.dart';
import 'package:bulk_app/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:bulk_app/features/home/logic/cubit/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/auth/data/repos/login_repo.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';
import '../../features/manage_audiances/presentation/cubits/manage_templates_cubit/manage_audiances_cubit.dart';
import '../../features/templates/data/repos/templates_repo.dart';
import '../../features/templates/logic/add_template_cubit/add_template_cubit.dart';
import '../../features/templates/logic/templates_cubit/templates_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<TemplatesRepo>( () => TemplatesRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit());
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<TemplatesCubit>(() => TemplatesCubit());
  getIt.registerFactory<AddTemplateCubit>(() => AddTemplateCubit(getIt()));
  getIt.registerFactory<ManageAudiancesCubit>(() => ManageAudiancesCubit());
      // * App Media
  getIt.registerLazySingleton<AppMedia>(
      () => AppMedia(imagePicker: ImagePicker()));
  // // signup
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // home
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}

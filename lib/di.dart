import 'package:app/helpers/dimension_helper.dart';
import 'package:app/implementations/http_module.dart';
import 'package:app/interceptors/api_interceptor.dart';
import 'package:app/repositories/palestine_repo.dart';
import 'package:app/services/routes.dart';
import 'package:app/utils/api_url.dart';
import 'package:app/utils/text_styles.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Helpers
  sl.registerLazySingleton<DimensionHelper>(DimensionHelper.new);

  /// Interceptors
  sl.registerLazySingleton<ApiInterceptor>(HttpModule.new);

  /// Repositories
  sl.registerLazySingleton<PalestineRepository>(PalestineRepository.new);

  /// Services
  sl.registerFactory(Routes.new);

  /// Utils
  sl.registerLazySingleton<ApiUrl>(ApiUrl.new);
  sl.registerLazySingleton<TextStyles>(TextStyles.new);
}

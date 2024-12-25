import 'package:dish_it/core/bloc/bloc_observer.dart';
import 'package:dish_it/core/bloc/cubit/global_cubit.dart';
import 'package:dish_it/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(() => MyBlocObserver());
}

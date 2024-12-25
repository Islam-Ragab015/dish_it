import 'package:dish_it/app/app.dart';
import 'package:dish_it/core/bloc/cubit/global_cubit.dart';
import 'package:dish_it/core/database/cache/cache_helper.dart';
import 'package:dish_it/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
    BlocProvider(
      create: (context) => sl<GlobalCubit>()..getCachedLanguage(),
      child: ChefApp(),
    ),
  );
}

import 'package:dish_it/core/bloc/cubit/global_cubit.dart';
import 'package:dish_it/core/bloc/cubit/global_state.dart';
import 'package:dish_it/core/locale/app_locale.dart';
import 'package:dish_it/core/routes/app_routes.dart';
import 'package:dish_it/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'EG'),
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
            initialRoute: Routes.home,
            theme: AppTheme.getThemeData(),
            onGenerateRoute: AppRoutes.generateAppRoutes,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

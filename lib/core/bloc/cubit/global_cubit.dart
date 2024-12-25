import 'package:dish_it/core/bloc/cubit/global_state.dart';
import 'package:dish_it/core/database/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dish_it/core/services/service_locator.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  bool isArabic = false;
  String langCode = 'en';

  void toggleLanguage(String languageCode) async {
    emit(ChangeLanguageLoadingState());

    // Check if the current language is different from the selected one
    if (langCode == languageCode) {
      return; // No change if the same language is selected
    }

    // Toggle the language
    isArabic = (languageCode == 'ar');
    langCode = languageCode;
    await sl<CacheHelper>().cacheLanguage(languageCode);

    emit(ChangeLanguageSuccessState());
  }

  void getCachedLanguage() async {
    emit(ChangeLanguageLoadingState());
    final cachedLanguage = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLanguage;
    emit(ChangeLanguageSuccessState());
    isArabic = (langCode == 'ar');
  }
}

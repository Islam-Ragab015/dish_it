sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class ChangeLanguageLoadingState extends GlobalState {}

final class ChangeLanguageSuccessState extends GlobalState {}

final class ChangeLanguageErrorState extends GlobalState {}

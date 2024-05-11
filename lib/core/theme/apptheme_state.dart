part of 'apptheme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}
final class AppChangeTheme extends AppThemeState {
  final String? appTheme;
  AppChangeTheme({this.appTheme});
}
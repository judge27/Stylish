part of 'apptheme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}
final class AppLightTheme extends AppThemeState {}
final class AppDarkTheme extends AppThemeState {}
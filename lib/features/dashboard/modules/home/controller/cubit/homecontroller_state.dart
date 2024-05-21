part of 'homecontroller_cubit.dart';

@immutable
sealed class HomecontrollerState {}

final class HomecontrollerLoading extends HomecontrollerState {}
final class HomecontrollerLoaded extends HomecontrollerState {}
final class HomecontrollerEmpty extends HomecontrollerState {}
final class HomecontrollerChanged extends HomecontrollerState {}

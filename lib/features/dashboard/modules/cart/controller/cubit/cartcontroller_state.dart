part of 'cartcontroller_cubit.dart';

@immutable
sealed class CartcontrollerState {}

final class CartcontrollerFeteched extends CartcontrollerState {}
final class CartcontrollerLoading extends CartcontrollerState {}
final class CartcontrollerEmpty extends CartcontrollerState {}
final class CartcontrollerRemoved extends CartcontrollerState {}
final class CartcontrollerLoaded extends CartcontrollerState {}



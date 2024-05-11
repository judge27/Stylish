part of 'productscontroller_cubit.dart';

@immutable
sealed class ProductscontrollerState {}

final class ProductscontrollerLoading extends ProductscontrollerState {}
final class ProductscontrollerLoaded extends ProductscontrollerState {}
final class ProductscontrollerEmpty extends ProductscontrollerState {}
final class ProductscontrollerSearched extends ProductscontrollerState {}

part of 'productdetails_cubit.dart';

@immutable
sealed class ProductdetailsState {}

final class ProductdetailsLoading extends ProductdetailsState {}

final class ProductdetailsLoaded extends ProductdetailsState {}

final class ProductdetailsEmpty extends ProductdetailsState {}

final class ProductdetailsFetchCategory extends ProductdetailsState {}

final class ProductdetailsChanged extends ProductdetailsState {}
class ProductdetailsUpdated extends ProductdetailsState {
  final ProductModel updatedProduct;

  ProductdetailsUpdated({required this.updatedProduct});
}
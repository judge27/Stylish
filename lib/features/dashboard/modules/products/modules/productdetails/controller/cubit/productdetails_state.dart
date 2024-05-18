part of 'productdetails_cubit.dart';

@immutable
sealed class ProductdetailsState {}

final class ProductdetailsLoading extends ProductdetailsState {}

final class ProductdetailsLoaded extends ProductdetailsState {}

final class ProductdetailsEmpty extends ProductdetailsState {}


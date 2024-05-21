part of 'favoriteproduct_cubit.dart';

@immutable
sealed class FavoriteproductState {}

final class FavoriteproductLoading extends FavoriteproductState {}
final class FavoriteproductLoaded extends FavoriteproductState {}
final class FavoriteproductEmpty extends FavoriteproductState {}
final class FavoriteproductRemoved extends FavoriteproductState {}
final class FavoriteproductChanged extends FavoriteproductState {}

part of 'rateourapplication_cubit.dart';

@immutable
sealed class RateourapplicationState {
  late final double rating;
  late final bool submitted;

  RateourapplicationState({required this.rating, required this.submitted});
}

final class RateourapplicationInitial extends RateourapplicationState {
  RateourapplicationInitial({required super.rating, required super.submitted});

  @override
  RatingState({required rating, required submitted}) {
    // TODO: implement RatingState
    throw UnimplementedError();
  }
}

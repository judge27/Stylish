import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rateourapplication_state.dart';

class RateourapplicationCubit extends Cubit<RateourapplicationState> {
  static RateourapplicationCubit instance =RateourapplicationCubit();
  RateourapplicationCubit() : super(RateourapplicationInitial(rating: 0,submitted: false));

  void submitRating(double rating) {
    emit(RateourapplicationInitial(rating: rating, submitted: true));
  }
}

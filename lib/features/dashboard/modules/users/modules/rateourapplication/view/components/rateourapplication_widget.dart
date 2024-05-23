import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:stylish/features/dashboard/modules/users/modules/rateourapplication/controller/cubit/rateourapplication_cubit.dart';

class RateOurApplicationWidget extends StatelessWidget {
  RateOurApplicationWidget(this.cubit);

  final RateourapplicationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RateourapplicationCubit>.value(
      value: cubit,
      child: BlocBuilder<RateourapplicationCubit, RateourapplicationState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                final _ratingDialog = RatingDialog(
                  title: const Text(
                    'Rate this app',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  message: const Text(
                    'Tap a star to set your rating. Add more description here if you want.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  image: const Icon(
                    Icons.star,
                    size: 100,
                    color: Colors.amber,
                  ),
                  submitButtonText: 'Submit',
                  onSubmitted: (response) {
                    cubit.submitRating(response.rating);
                  },
                );
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => _ratingDialog,
                );
              },
              child: const Text('Rate Now'),
            ),
          );
        },
      ),
    );
  }


}

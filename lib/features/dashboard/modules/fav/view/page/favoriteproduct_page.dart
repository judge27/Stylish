import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/fav/controller/cubit/favoriteproduct_cubit.dart';
import 'package:stylish/features/dashboard/modules/fav/view/components/favoriteproduct_widget.dart';

class FavoriteProductPage extends StatelessWidget {
  const FavoriteProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
     value:  FavoriteproductCubit.instance,
      child: BlocBuilder<FavoriteproductCubit, FavoriteproductState>(
        builder: (context, state) {
          final FavoriteproductCubit cubit =context.read<FavoriteproductCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            body: FavoriteProductWidget(cubit:cubit,),
          );
        },
      ),
    );
  }
}

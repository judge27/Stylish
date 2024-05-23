import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/users/modules/rateourapplication/view/components/rateourapplication_widget.dart';

import '../../controller/cubit/rateourapplication_cubit.dart';

class RateOurApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RateourapplicationCubit>.value(
      value: RateourapplicationCubit.instance,
      child: BlocBuilder<RateourapplicationCubit, RateourapplicationState>(
        builder: (context, state) {
          final RateourapplicationCubit cubit =context.read<RateourapplicationCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: InkWell(
                  onTap: () {
                    context.pop;
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              title: Text(
                "Rate Our App",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Theme.of(context).hintColor),
              ),
              centerTitle: true,
            ),
            body: RateOurApplicationWidget(cubit),
          );
        },
      ),
    );
  }
}
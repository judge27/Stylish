import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/users/modules/password/controller/cubit/changepassword_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/password/view/components/changepassword_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangepasswordCubit>(
  create: (context) => ChangepasswordCubit(),
  child: BlocBuilder<ChangepasswordCubit, ChangepasswordState>(
  builder: (context, state) {
    final ChangepasswordCubit cubit =context.read<ChangepasswordCubit>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: SizedBox(
        height: context.height/4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){
                    cubit.onSaveChanges(context: context);
                  },
                  child: Core.instance.coreButton(height: context.height/12,buttonText: "      SAVE CHANGES    ", context: context)),
              SizedBox(height: context.height/24,),
              InkWell(
                  onTap: (){
                    context.pop;
                  },
                  child: Core.instance.coreButton(height: context.height/12,buttonText: "      Cancel    ", context: context)),
              SizedBox(height: context.height/24,),
            ],
          ),
        ),
      ),
      body: ChangePasswordWidget(cubit: cubit,),
    );
  },
),
);
  }
}

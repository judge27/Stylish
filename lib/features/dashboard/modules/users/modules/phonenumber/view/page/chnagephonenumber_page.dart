import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/users/modules/phonenumber/controller/cubit/changephonenumber_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/phonenumber/view/components/changephonenumber_widget.dart';

class ChangePhoneNumberPage extends StatelessWidget {
  const ChangePhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangephonenumberCubit>(
      create: (context) => ChangephonenumberCubit(),
      child: BlocBuilder<ChangephonenumberCubit, ChangephonenumberState>(
        builder: (context, state) {
          final ChangephonenumberCubit cubit = context.read<ChangephonenumberCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            bottomNavigationBar: SizedBox(
              height: context.height/4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
            body: ChangePhoneNumberWidget(cubit: cubit,),
          );
        },
      ),
    );
  }
}

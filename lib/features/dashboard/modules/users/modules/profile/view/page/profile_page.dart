import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/utils/core.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/view/components/profile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilecontrollerCubit>(
      create: (context) => ProfilecontrollerCubit.instance,
      child: BlocBuilder<ProfilecontrollerCubit, ProfilecontrollerState>(
        builder: (context, state) {
          final ProfilecontrollerCubit cubit =context.read<ProfilecontrollerCubit>();
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            bottomNavigationBar: SizedBox(
              height: 150,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () async{
                          await cubit.onSave(context: context);
                        },
                        child: Core.instance.coreButton(
                          buttonText: AppLocalizations.of(context)!.save,
                          context: context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: ProfileWidget(controller: cubit,),
          );
        },
      ),
    );
  }
}

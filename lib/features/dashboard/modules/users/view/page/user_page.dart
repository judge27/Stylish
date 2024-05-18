import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/modules/profile/controller/cubit/profilecontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/settings_widget.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilecontrollerCubit>.value(
        value:  ProfilecontrollerCubit.instance,
        child: BlocBuilder<ProfilecontrollerCubit, ProfilecontrollerState>(
          builder: (context, state) {
            final ProfilecontrollerCubit controller =
                context.read<ProfilecontrollerCubit>();
            return Scaffold(
              body:
              SettingsWidget(cubit: controller,),
            );
          },
        ));
  }
}

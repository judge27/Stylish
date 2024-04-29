import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/features/dashboard/modules/users/controller/cubit/usercontroller_cubit.dart';
import 'package:stylish/features/dashboard/modules/users/view/components/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsercontrollerCubit>(
        create: (context) => UsercontrollerCubit(),
        child: BlocBuilder<UsercontrollerCubit, UsercontrollerState>(
          builder: (context, state) {
            final UsercontrollerCubit controller =
                context.read<UsercontrollerCubit>();
            return Scaffold(
              body: state is UserLoading
                  ? CircularProgressIndicator()
                  : state is UserEmpty
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.delete,

                              color: Colors.black,
                            ),
                            Text("Empty Data",style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                            ),)
                          ],
                        )
                      :  const UserItemWidget(),
            );
          },
        ));
  }
}

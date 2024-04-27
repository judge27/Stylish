import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/user_cubit.dart';
import '../component/user_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          final UserCubit controller = context.read<UserCubit>();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(9.5, 19),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(
                  margin: EdgeInsets.only(left: 22),
                  child: Icon(Icons.arrow_back), // Replace with your leading icon
                ),
                shape: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                title: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [], // Add any actions if needed
              ),
            ),
            body: state is UserLoading
                ? const CircularProgressIndicator()
                : state is UserEmpty
                ? const Center(
                child: Icon(
                  CupertinoIcons.delete,
                  size: 100,
                  color: Colors.grey,
                ))
                : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, crossAxisSpacing: 10, mainAxisSpacing: 10),
                // separatorBuilder: (_, int index) => const Divider(
                //       height: 1,
                //       thickness: 5,
                //     ),
                itemCount: controller.users.length,
                itemBuilder: (_, int index) {
                  return UserItemWidget(userModel: controller.users[index]);
                }),
          );
        },
      ),
    );
  }
}

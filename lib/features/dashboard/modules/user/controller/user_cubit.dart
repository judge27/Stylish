import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/repo/firebase_data.dart';
import '../model/user_model.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading()) {
    init();
  }
  List<UserModel> users = [];
  Future<void> init() async {
    emit(UserLoading());
    users = await FirebaseRepo.instance.fetch();
    if (users.isEmpty) {
      emit(UserEmpty());
    } else {
      emit(UserLoaded());
    }
  }
}
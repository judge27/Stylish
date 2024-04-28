
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/database_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

part 'usercontroller_state.dart';

class UsercontrollerCubit extends Cubit<UsercontrollerState> {
  UsercontrollerCubit() : super(UserLoading()){
    init();
  }

  // password showen & hiden value
  bool obscurePassword = true;

  // controller object of name textField
  TextEditingController nameController = TextEditingController();

  // controller object of email textField
  TextEditingController emailController = TextEditingController();

  // controller object of password textField
  TextEditingController passwordController = TextEditingController();


void getImage() async{
  FireBaseModel.instance.image= await FireBaseModel.instance.pickImage(
      source: ImageSource.gallery);
    emit(UserImage());
}
  // list of the users in userPage
  List<UserModel>users =[];
  // Show & Hide Password Method
  void togglePassword(){
    obscurePassword = !obscurePassword;
    emit(UserScured());
  }

  // Initilize the user page
  Future<void> init() async{
    emit(UserLoading());
    users= await (await DatabaseUsersData.getInstance).fetech();
    if(users.isEmpty){
      emit(UserEmpty());
    }
    else {
      nameController.text=FireBaseModel.instance.name;
      emailController.text=FireBaseModel.instance.email;
      passwordController.text=FireBaseModel.instance.password;
      emit(UserLoaded());
    }
  }

  Future<void> onSave({required BuildContext context}) async{
    FireBaseModel.instance.name=nameController.text;
    FireBaseModel.instance.email=emailController.text;
    FireBaseModel.instance.password=passwordController.text;
    FireBaseModel.instance.image=FireBaseModel.instance.image;

    context.showToastMessage="User Updated Sucessfully";
  }
}

part of 'logincontroller_cubit.dart';


sealed class LogincontrollerState {}

final class LogincontrollerInitial extends LogincontrollerState {}

final class LogincontrollerSecured extends LogincontrollerState {}
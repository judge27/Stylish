part of 'changepassword_cubit.dart';

@immutable
sealed class ChangepasswordState {}

final class ChangepasswordInitial extends ChangepasswordState {}
final class ChangepasswordSecured extends ChangepasswordState {}

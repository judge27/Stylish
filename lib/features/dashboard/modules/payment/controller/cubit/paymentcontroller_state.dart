part of 'paymentcontroller_cubit.dart';

@immutable
sealed class PaymentcontrollerState {}

final class PaymentcontrollerInitial extends PaymentcontrollerState {}
final class PaymentcontrollerChanged extends PaymentcontrollerState {}

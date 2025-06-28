part of 'drivers_bloc.dart';

abstract class DriversState {}

class DriversInitial extends DriversState {}

class DriversLoading extends DriversState {}

class DriversLoaded extends DriversState {
  final List<Map<String, dynamic>> orders;
  DriversLoaded(this.orders);
}

class DriversError extends DriversState {
  final String message;
  DriversError(this.message);
}
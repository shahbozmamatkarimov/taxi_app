part of 'driver_bloc.dart';

abstract class DriverState {}

class DriverInitial extends DriverState {}

class DriverLoading extends DriverState {}

class DriverLoaded extends DriverState {
  final List<Map<String, dynamic>> applications;
  DriverLoaded(this.applications);
}

class DriverError extends DriverState {
  final String message;
  DriverError(this.message);
}
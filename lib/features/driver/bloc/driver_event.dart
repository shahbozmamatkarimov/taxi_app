part of 'driver_bloc.dart';

abstract class DriverEvent {}

class FetchDriverApplications extends DriverEvent {}
class AcceptDriver extends DriverEvent {
  final String driverId;
  AcceptDriver(this.driverId);
}
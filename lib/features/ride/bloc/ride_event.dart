part of 'ride_bloc.dart';

abstract class RideEvent {}

class SelectRideOption extends RideEvent {
  final String option;
  SelectRideOption(this.option);
}

class BookRide extends RideEvent {}
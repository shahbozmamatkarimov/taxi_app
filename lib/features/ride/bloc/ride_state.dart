part of 'ride_bloc.dart';

abstract class RideState {}

class RideInitial extends RideState {}

class RideLoading extends RideState {}

class RideLoaded extends RideState {
  final String selectedOption;
  final double price;
  RideLoaded(this.selectedOption, this.price);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RideLoaded &&
          runtimeType == other.runtimeType &&
          selectedOption == other.selectedOption &&
          price == other.price;

  @override
  int get hashCode => selectedOption.hashCode ^ price.hashCode;
}

class RideError extends RideState {
  final String message;
  RideError(this.message);
}
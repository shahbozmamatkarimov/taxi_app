import 'package:flutter_bloc/flutter_bloc.dart';
part 'driver_event.dart';
part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  DriverBloc() : super(DriverInitial()) {
    on<FetchDriverApplications>(_onFetchDriverApplications);
    on<AcceptDriver>(_onAcceptDriver);
  }

  void _onFetchDriverApplications(FetchDriverApplications event, Emitter<DriverState> emit) {
    emit(DriverLoading());
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      final applications = [
        {
          'id': '1',
          'name': 'Akmal Karimov',
          'rating': 4.8,
          'car': 'Chevrolet Cobalt',
          'plate': '01A123BC',
          'distance': '2.5 km',
          'arrival': '5 min',
          'experience': '3 years',
          'trips': 1240,
        },
        {
          'id': '2',
          'name': 'Bobur Saidov',
          'rating': 4.6,
          'car': 'Toyota Camry',
          'plate': '01B456EF',
          'distance': '4.1 km',
          'arrival': '8 min',
          'experience': '2 years',
          'trips': 890,
        },
        {
          'id': '3',
          'name': 'Sardor Umarov',
          'rating': 4.9,
          'car': 'Hyundai Elantra',
          'plate': '01C789GH',
          'distance': '6.3 km',
          'arrival': '12 min',
          'experience': '4 years',
          'trips': 1560,
        },
      ];
      emit(DriverLoaded(applications));
    });
  }

  void _onAcceptDriver(AcceptDriver event, Emitter<DriverState> emit) {
    // Handle driver acceptance logic
    emit(DriverLoading());
    Future.delayed(const Duration(seconds: 1), () {
      // Update state after acceptance
      add(FetchDriverApplications());
    });
  }
}
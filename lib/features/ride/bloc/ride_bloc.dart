import 'package:flutter_bloc/flutter_bloc.dart';
part 'ride_event.dart';
part 'ride_state.dart';

class RideBloc extends Bloc<RideEvent, RideState> {
  RideBloc() : super(RideInitial()) {
    on<SelectRideOption>(_onSelectRideOption);
    on<BookRide>(_onBookRide);
  }

  void _onSelectRideOption(SelectRideOption event, Emitter<RideState> emit) {
    print('SelectRideOption ishga tushdi: ${event.option}'); // Debug log
    final priceMap = {'Economy': 12.50, 'Comfort': 18.20, 'Premium': 25.80};
    final price = priceMap[event.option] ?? 0.0;
    emit(RideLoaded(event.option, price)); // Darhol holatni chiqaramiz
  }

  void _onBookRide(BookRide event, Emitter<RideState> emit) {
    emit(RideLoading());
    print('BookRide ishga tushdi, loading holati chiqarildi'); // Debug log
    Future.delayed(const Duration(seconds: 1), () {
      print('BookRide yakunlandi, RideLoaded chiqariladi'); // Debug log
      emit(RideLoaded('Economy', 12.50)); // Bookingdan keyin holat
    });
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrders>(_onFetchOrders);
  }

  Future<void> _onFetchOrders(FetchOrders event, Emitter<OrdersState> emit) async {
    print('FetchOrders ishga tushdi'); // Debug log
    emit(OrdersLoading());
    try {
      // Simulate API call with async/await
      await Future.delayed(const Duration(seconds: 1));
      print('FetchOrders yakunlandi, OrdersLoaded chiqariladi'); // Debug log
      final orders = [
        {
          'id': 'ORD-001',
          'status': 'Pending',
          'from': 'Tashkent International Airport',
          'to': 'Mirzo Ulugbek District',
          'price': 120000,
          'passengers': 2,
          'luggage': true,
          'date': '15 Jul, 08:30',
        },
        {
          'id': 'ORD-002',
          'status': 'Accepted',
          'from': 'Chilanzar Metro Station',
          'to': 'Samarkand',
          'price': 250000,
          'passengers': 1,
          'luggage': false,
          'date': '16 Jul, 14:00',
          'driver': {'name': 'Akmal Karimov', 'rating': 4.8, 'car': 'Chevrolet Cobalt', 'plate': '01A123BC'},
        },
      ];
      emit(OrdersLoaded(orders)); // Holatni chiqaramiz
    } catch (e) {
      print('Xatolik yuz berdi: $e'); // Xatoliklarni kuzatish
      emit(OrdersError('Ma\'lumotlarni yuklashda xatolik: $e'));
    }
  }
}
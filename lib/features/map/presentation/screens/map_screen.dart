import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';
import 'get_location.dart'; // Bu sizning `getAddress()` funksiyangiz joylashgan fayl

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  YandexMapController? _mapController;
  Point? _myLocation;
  Point? _selectedPoint;
  String _pointInfo = '';
  bool isMyLocation = false;

  @override
  void initState() {
    super.initState();
    _initLocation();
    _listenToLocationChanges(); // 👉 Qo‘shildi
  }

  StreamSubscription<Position>? _positionStream;

  void _listenToLocationChanges() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 5, // Har 5 metrda yangilanadi
    );

    _positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position position) async {
      final newLocation = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Xarita markerni va kamerani harakatlantiradi
      setState(() {
        _myLocation = newLocation;
        isMyLocation = true; // 👉 Qo‘shildi
        _selectedPoint = _myLocation;
      });

      if (_mapController != null && isMyLocation) {
        _mapController!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: newLocation, zoom: 16),
          ),
          animation: const MapAnimation(duration: 0.5),
        );
      }
    });
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  /// Joylashuv ruxsatlarini tekshirish va olish
  Future<void> _initLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    try {
      final position = await Geolocator.getCurrentPosition();
      _myLocation = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      _selectedPoint = _myLocation;

      // Xaritani foydalanuvchi joylashuviga ko'chirish
      if (_mapController != null) {
        _moveToUser();
      }

      final address = await getAddress(position.latitude, position.longitude);
      setState(() {
        _pointInfo = address;
      });
    } catch (e) {
      print('Xatolik: $e');
      setState(() {
        _pointInfo =
            'Manzilni olishda xatolik yuz berdi: $e'; // Xatolik haqida to'liq ma'lumot
      });
    }
  }

  /// Xaritani foydalanuvchining joylashuviga harakatlantiradi
  void _moveToUser() {
    if (_myLocation != null && _mapController != null) {
      _mapController!.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: _myLocation!, zoom: 16),
        ),
        animation: const MapAnimation(duration: 0.5),
      );
      setState(() {
        isMyLocation = true;
        _selectedPoint = _myLocation;
      });
    }
  }

  /// Ruxsatlarni tekshiradi
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled.')),
      );
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permissions are permanently denied'),
        ),
      );
      return false;
    }

    return true;
  }

  /// FindMe tugmasi bosilganda
  Future<void> _onFindMePressed() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    try {
      final position = await Geolocator.getCurrentPosition();
      _myLocation = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      final address = await getAddress(position.latitude, position.longitude);
      setState(() {
        _pointInfo = address;
        _selectedPoint = _myLocation;
        isMyLocation = true;
      });

      _moveToUser();
    } catch (e) {
      print('Xatolik: $e');
      setState(() {
        _pointInfo =
            'Manzilni olishda xatolik yuz berdi: $e'; // Xatolik haqida to'liq ma'lumot
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            YandexMap(
              onMapCreated: (controller) {
                _mapController = controller;
                // Joylashuv tayyor bo'lganidan so'ng moveCamera bajariladi
                if (_myLocation != null) {
                  _moveToUser();
                }
              },
              onMapTap: (point) async {
                _selectedPoint = point;
                try {
                  _pointInfo = await getAddress(
                    point.latitude,
                    point.longitude,
                  );
                  isMyLocation = false;

                  _mapController?.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: point, zoom: 15.0),
                    ),
                    animation: const MapAnimation(duration: 0.5),
                  );

                  setState(() {});
                } catch (e) {
                  print('Xatolik: $e');
                  setState(() {
                    _pointInfo =
                        'Manzilni olishda xatolik yuz berdi: $e'; // Xatolik haqida to'liq ma'lumot
                  });
                }
              },
              mapObjects: [
                if (_myLocation != null)
                  PlacemarkMapObject(
                    mapId: const MapObjectId('my_location_marker'),
                    point: _myLocation!,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          'assets/img/my_location.png',
                        ),
                        scale: 0.3,
                        anchor: const Offset(0.5, 1),
                      ),
                    ),
                  ),
                if (_selectedPoint != null && !isMyLocation)
                  PlacemarkMapObject(
                    mapId: const MapObjectId('selected_point'),
                    point: _selectedPoint!,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                          'assets/img/marker.png',
                        ),
                        scale: 0.3,
                        anchor: const Offset(0.5, 1),
                      ),
                    ),
                  ),
              ],
            ),
            if (_pointInfo.isNotEmpty)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(_pointInfo, style: const TextStyle(fontSize: 16)),
                ),
              ),
            // 🔽 Zoom tugmalari shu yerda
            Positioned(
              top: 100,
              right: 10,
              child: Column(
                children: [
                  FloatingActionButton(
                    mini: true,
                    heroTag: 'zoom_in',
                    onPressed: () {
                      _mapController?.getCameraPosition().then((
                        cameraPosition,
                      ) {
                        _mapController?.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: cameraPosition.target,
                              zoom: cameraPosition.zoom + 1,
                            ),
                          ),
                          animation: const MapAnimation(duration: 0.3),
                        );
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    mini: true,
                    heroTag: 'zoom_out',
                    onPressed: () {
                      _mapController?.getCameraPosition().then((
                        cameraPosition,
                      ) {
                        _mapController?.moveCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: cameraPosition.target,
                              zoom: cameraPosition.zoom - 1,
                            ),
                          ),
                          animation: const MapAnimation(duration: 0.3),
                        );
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onFindMePressed,
          child: const Icon(Icons.location_on),
        ),
      );
  }
}

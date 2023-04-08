// ignore_for_file: must_be_immutable, avoid_catches_without_on_clauses

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

import '../state/geoloc/geoloc_notifier.dart';
import '../state/geoloc/geoloc_state.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final loc.Location location = loc.Location();

  StreamSubscription<loc.LocationData>? locationSubscription;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    //-----------------------------//
    requestPermission();

    var one_minutes = 60000;

    location
      ..changeSettings(interval: one_minutes * 5)
      ..enableBackgroundMode();
    //-----------------------------//

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: getLocation,
                  child: const Icon(Icons.maps_ugc_sharp),
                ),
                GestureDetector(
                  onTap: listenLocation,
                  child: const Icon(Icons.play_arrow),
                ),
                GestureDetector(
                  onTap: _stopListening,
                  child: const Icon(Icons.stop),
                ),
              ],
            ),
            Divider(
              color: Colors.white.withOpacity(0.6),
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> requestPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      debugPrint('done');
    } else if (status.isDenied) {
      await requestPermission();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  ///
  Future<void> getLocation() async {
    try {
      final locationResult = await location.getLocation();

      await insertGeoloc(location: locationResult);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///
  Future<void> listenLocation() async {
    locationSubscription = location.onLocationChanged.handleError((onError) {
      locationSubscription?.cancel();
    }).listen((loc.LocationData currentLocation) async {
      await insertGeoloc(location: currentLocation);
    });
  }

  ///
  Future<void> insertGeoloc({required loc.LocationData location}) async {
    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm');
    final currentTime = timeFormat.format(now);

    await _ref.watch(insertGeolocProvider.notifier).insertGeoloc(
          param: GeolocState(
            date: now,
            time: currentTime,
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString(),
          ),
        );
  }

  ///
  Future<void> _stopListening() async {
    await locationSubscription?.cancel();
  }
}

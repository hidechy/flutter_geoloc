// ignore_for_file: must_be_immutable, depend_on_referenced_packages, avoid_bool_literals_in_conditional_expressions, cascade_invocations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../extensions/extensions.dart';
import '../../state/app_param/app_param_notifier.dart';
import '../../state/period_lat_lng/period_lat_lng_notifier.dart';

class PeriodMapAlert extends ConsumerWidget {
  PeriodMapAlert({super.key, required this.date});

  final DateTime date;

  double boundsLatLngDiffSmall = 0;

  late double boundsInner;

  Map<String, double> boundsLatLngMap = {};

  List<Marker> markerList = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    makeBounds();

    makeMarker();

    final appParamState = ref.watch(appParamProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------------
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  bounds: LatLngBounds(
                    LatLng(
                      boundsLatLngMap['minLat']! - boundsInner,
                      boundsLatLngMap['minLng']! - boundsInner,
                    ),
                    LatLng(
                      boundsLatLngMap['maxLat']! + boundsInner,
                      boundsLatLngMap['maxLng']! + boundsInner,
                    ),
                  ),
                ),
                children: [
                  if (appParamState.mapHide) TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                  MarkerLayer(markers: markerList),
                ],
              ),
            ),
            //---------------------------------------------

            IconButton(
              onPressed: () =>
                  ref.watch(appParamProvider.notifier).setMapHide(value: (appParamState.mapHide) ? false : true),
              icon: Icon(
                Icons.ac_unit,
                color: (appParamState.mapHide) ? Colors.yellowAccent.withOpacity(0.6) : Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  void makeBounds() {
    final latList = <double>[];
    final lngList = <double>[];

    final geolocPeriodState = _ref.watch(geolocPeriodProvider);

    geolocPeriodState.forEach((element) {
      latList.add(element.latitude.toDouble());
      lngList.add(element.longitude.toDouble());
    });

    final minLat = latList.reduce(min);
    final maxLat = latList.reduce(max);
    final minLng = lngList.reduce(min);
    final maxLng = lngList.reduce(max);

    final latDiff = maxLat - minLat;
    final lngDiff = maxLng - minLng;
    boundsLatLngDiffSmall = (latDiff < lngDiff) ? latDiff : lngDiff;
    boundsInner = boundsLatLngDiffSmall * 0.2;

    boundsLatLngMap = {'minLat': minLat, 'maxLat': maxLat, 'minLng': minLng, 'maxLng': maxLng};
  }

  ///
  void makeMarker() {
    markerList = [];

    final geolocPeriodState = _ref.watch(geolocPeriodProvider);

    for (var i = 0; i < geolocPeriodState.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(geolocPeriodState[i].latitude.toDouble(), geolocPeriodState[i].longitude.toDouble()),
          builder: (context) {
            return const Text(
              '*',
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            );
          },
        ),
      );
    }
  }
}

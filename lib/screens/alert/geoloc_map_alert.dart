// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';

class GeolocMapAlert extends ConsumerWidget {
  GeolocMapAlert({super.key, required this.geolocList});

  final List<Geoloc> geolocList;

  double boundsLatLngDiffSmall = 0;

  late double boundsInner;

  Map<String, double> boundsLatLngMap = {};

  List<Marker> markerList = [];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    makeBounds();

    makeMarker();

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(markers: markerList),
                ],
              ),
            ),
            //---------------------------------------------
          ],
        ),
      ),
    );
  }

  ///
  void makeBounds() {
    final latList = <double>[];
    final lngList = <double>[];

    geolocList.forEach((element) {
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

    boundsLatLngMap = {
      'minLat': minLat,
      'maxLat': maxLat,
      'minLng': minLng,
      'maxLng': maxLng,
    };
  }

  ///
  void makeMarker() {
    markerList = [];

    for (var i = 0; i < geolocList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(
            geolocList[i].latitude.toDouble(),
            geolocList[i].longitude.toDouble(),
          ),
          builder: (context) {
            return const Text(
              '*',
              style: TextStyle(
                fontSize: 20,
                color: Colors.redAccent,
              ),
            );
          },
        ),
      );
    }
  }
}

// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../state/map_pinpoint/map_pinpoint_notifier.dart';

class GeolocPinpointMapAlert extends ConsumerWidget {
  GeolocPinpointMapAlert({super.key, required this.geolocList});

  final List<Geoloc> geolocList;

  late CameraPosition initialCameraPosition;

  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  late Set<Marker> markers;

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    setMapParam();

    final mapPinpointState = ref.watch(mapPinpointProvider);

    //==============================
    markers = {
      Marker(
        markerId: MarkerId(mapPinpointState.pinpointTime),
        position: LatLng(mapPinpointState.pinpointLat, mapPinpointState.pinpointLng),
        infoWindow: InfoWindow(title: mapPinpointState.pinpointDate, snippet: mapPinpointState.pinpointTime),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      )
    };
    //==============================

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}'),
                          Text(
                            '${mapPinpointState.pinpointLat} / ${mapPinpointState.pinpointLng}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GoogleMap(
                    onMapCreated: mapController.complete,
                    initialCameraPosition: initialCameraPosition,
                    markers: markers,
                  ),
                ),
              ],
            )),
            SizedBox(
              width: 60,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Expanded(child: displayGeolocList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayGeolocList() {
    final list = <Widget>[];

    final pinpointTime = _ref.watch(mapPinpointProvider.select((value) => value.pinpointTime));

    geolocList.forEach(
      (element) {
        list.add(
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await _ref.watch(mapPinpointProvider.notifier).setPinpointLatLng(
                        date: element.date.yyyymmdd,
                        time: element.time,
                        lat: element.latitude.toDouble(),
                        lng: element.longitude.toDouble(),
                      );

                  await listNameTap(geoloc: element);
                },
                child: CircleAvatar(
                  backgroundColor: (pinpointTime == element.time) ? Colors.orangeAccent.withOpacity(0.6) : Colors.black,
                  child: Text(element.time, style: const TextStyle(fontSize: 8)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  void setMapParam() {
    final latLng = LatLng(geolocList[0].latitude.toDouble(), geolocList[0].longitude.toDouble());
    initialCameraPosition = CameraPosition(target: latLng, zoom: 15, tilt: 50);
  }

  ///
  Future<void> listNameTap({required Geoloc geoloc}) async {
    final googleMap = await mapController.future;

    await googleMap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(geoloc.latitude.toDouble(), geoloc.longitude.toDouble()), zoom: 15),
      ),
    );
  }
}

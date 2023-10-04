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

    ///
    final radiusNumbers = <int>[];
    for (var i = 12; i <= 19; i++) {
      radiusNumbers.add(i);
    }

    ///
    final radiusDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: radiusNumbers.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.toString(), style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
      value: mapPinpointState.pinpointMapZoom,
      onChanged: (value) async {
        await _ref.watch(mapPinpointProvider.notifier).setPinpointMapZoom(zoom: value!);
      },
    );

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}'),
                                Text(
                                  '${mapPinpointState.pinpointLat} / ${mapPinpointState.pinpointLng}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            radiusDropDown,
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GoogleMap(
                      onMapCreated: mapController.complete,
                      initialCameraPosition: initialCameraPosition,
                      markers: markers,
                    ),
                  ),
                ],
              ),
            ),
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
        final exTime = element.time.split(':');

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
                  child: Text('${exTime[0]}:${exTime[1]}', style: const TextStyle(fontSize: 12)),
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
    var pinpointMapZoom = _ref.watch(mapPinpointProvider.select((value) => value.pinpointMapZoom));

    final latLng = LatLng(geolocList[0].latitude.toDouble(), geolocList[0].longitude.toDouble());
    initialCameraPosition = CameraPosition(target: latLng, zoom: pinpointMapZoom.toDouble(), tilt: 50);
  }

  ///
  Future<void> listNameTap({required Geoloc geoloc}) async {
    var pinpointMapZoom = _ref.watch(mapPinpointProvider.select((value) => value.pinpointMapZoom));

    final googleMap = await mapController.future;

    await googleMap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(geoloc.latitude.toDouble(), geoloc.longitude.toDouble()),
          zoom: pinpointMapZoom.toDouble(),
          tilt: 50,
        ),
      ),
    );
  }
}

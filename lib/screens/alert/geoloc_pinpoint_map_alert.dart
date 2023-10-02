// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../state/map_pinpoint/map_pinpoint_notifier.dart';
import 'geoloc_dialog.dart';

class GeolocPinpointMapAlert extends ConsumerWidget {
  GeolocPinpointMapAlert({super.key, required this.geolocList});

  final List<Geoloc> geolocList;

  List<Marker> markerList = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final mapPinpointState = ref.watch(mapPinpointProvider);

    _makeMarker(lat: mapPinpointState.pinpointLat, lng: mapPinpointState.pinpointLng);

    return Scaffold(
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
                  /////////////////////////////// FlutterMap

                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(mapPinpointState.pinpointLat, mapPinpointState.pinpointLng),
                      zoom: 15,
                      maxZoom: 17,
                      minZoom: 3,
                    ),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                      MarkerLayer(markers: markerList),
                    ],
                  ),

                  /////////////////////////////// FlutterMap
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

                  await GeolocDialog(
                    context: _context,
                    widget: GeolocPinpointMapAlert(geolocList: geolocList),
                  );
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
  void _makeMarker({required double lat, required double lng}) {
    markerList = [];

    markerList.add(
      Marker(
        point: LatLng(lat, lng),
        builder: (context) {
          return DecoratedBox(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orangeAccent.withOpacity(0.6)),
            child: const Text('*'),
          );
        },
      ),
    );
  }
}

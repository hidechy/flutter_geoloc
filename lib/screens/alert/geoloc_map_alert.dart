// ignore_for_file: depend_on_referenced_packages, must_be_immutable, avoid_bool_literals_in_conditional_expressions, use_build_context_synchronously, avoid_catches_without_on_clauses

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../state/app_param/app_param_notifier.dart';
import '../../state/map_pinpoint/map_pinpoint_notifier.dart';
import '../../state/reverse_geo/reverse_geo_notifier.dart';
import '../../state/reverse_geo/reverse_geo_request_state.dart';
import '../../utility/utility.dart';
import 'geoloc_dialog.dart';
import 'geoloc_pinpoint_map_alert.dart';

class GeolocMapAlert extends ConsumerWidget {
  GeolocMapAlert({super.key, required this.geolocList});

  final List<Geoloc> geolocList;

  double boundsLatLngDiffSmall = 0;

  late double boundsInner;

  Map<String, double> boundsLatLngMap = {};

  List<Marker> markerList = [];

  List<Geoloc> uniqueTimeGeolocList = [];

  Utility utility = Utility();

  Map<String, String> distanceMap = {};

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    makeBounds();

    makeMarker();

    makeUniqueTimeGeolocList();

    final appParamState = ref.watch(appParamProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------------
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  bounds: LatLngBounds(
                    LatLng(boundsLatLngMap['minLat']! - boundsInner, boundsLatLngMap['minLng']! - boundsInner),
                    LatLng(boundsLatLngMap['maxLat']! + boundsInner, boundsLatLngMap['maxLng']! + boundsInner),
                  ),
                ),
                children: [
                  if (appParamState.mapHide) TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                  MarkerLayer(markers: markerList),
                ],
              ),
            ),
            //---------------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () =>
                      ref.watch(appParamProvider.notifier).setMapHide(value: (appParamState.mapHide) ? false : true),
                  icon: Icon(
                    Icons.ac_unit,
                    color:
                        (appParamState.mapHide) ? Colors.yellowAccent.withOpacity(0.6) : Colors.white.withOpacity(0.6),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await ref.watch(mapPinpointProvider.notifier).setPinpointLatLng(
                          date: uniqueTimeGeolocList[0].date.yyyymmdd,
                          time: uniqueTimeGeolocList[0].time,
                          lat: uniqueTimeGeolocList[0].latitude.toDouble(),
                          lng: uniqueTimeGeolocList[0].longitude.toDouble(),
                        );

                    await ref.watch(reverseGeoProvider.notifier).getReverseGeoState(
                          param: ReverseGeoRequestState(
                              latitude: uniqueTimeGeolocList[0].latitude, longitude: uniqueTimeGeolocList[0].longitude),
                        );

                    await ref.read(appParamProvider.notifier).setPinpointSpotNum(value: 0);

                    await ref.read(appParamProvider.notifier).setPinpointMapBoundsDisplay(value: false);

                    await GeolocDialog(
                      context: context,
                      widget: GeolocPinpointMapAlert(geolocList: uniqueTimeGeolocList, distanceMap: distanceMap),
                    );
                  },
                  icon: const Icon(Icons.map),
                ),
              ],
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

    boundsLatLngMap = {'minLat': minLat, 'maxLat': maxLat, 'minLng': minLng, 'maxLng': maxLng};
  }

  ///
  void makeMarker() {
    markerList = [];

    for (var i = 0; i < geolocList.length; i++) {
      markerList.add(
        Marker(
          point: LatLng(geolocList[i].latitude.toDouble(), geolocList[i].longitude.toDouble()),
          builder: (context) => const Text('*', style: TextStyle(fontSize: 20, color: Colors.redAccent)),
        ),
      );
    }
  }

  ///
  void makeUniqueTimeGeolocList() {
    uniqueTimeGeolocList = [];

    var originLat = '';
    var originLng = '';
    var destLat = '';
    var destLng = '';

    var distance = '';

    var hundred = '';

    var originTime = '';
    var destTime = '';

    geolocList.sort((a, b) => a.time.compareTo(b.time));

    uniqueTimeGeolocList.add(geolocList[0]);

    for (var i = 1; i < geolocList.length; i++) {
      originLat = geolocList[i - 1].latitude;
      originLng = geolocList[i - 1].longitude;
      destLat = geolocList[i].latitude;
      destLng = geolocList[i].longitude;

      originTime = geolocList[i - 1].time;
      destTime = geolocList[i].time;

      if ((originLat == destLat) && (originLng == destLng)) {
        continue;
      }

      if (originTime == destTime) {
        continue;
      }

      try {
        distance = utility.calcDistance(
          originLat: geolocList[i - 1].latitude.toDouble(),
          originLng: geolocList[i - 1].longitude.toDouble(),
          destLat: geolocList[i].latitude.toDouble(),
          destLng: geolocList[i].longitude.toDouble(),
        );

        hundred = distance.split('.')[1].substring(0, 1);

        if (hundred.toInt() > 0) {
          uniqueTimeGeolocList.add(geolocList[i]);

          distanceMap['${geolocList[i].date.yyyymmdd} ${geolocList[i].time}'] = distance;
        }
      } catch (e) {
        debugPrint('$originTime : $originLat | $originLng');
        debugPrint('$destTime : $destLat | $destLng');
      }
    }
  }
}

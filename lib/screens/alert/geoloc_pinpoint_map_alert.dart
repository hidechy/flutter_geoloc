// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../state/app_param/app_param_notifier.dart';
import '../../state/map_pinpoint/map_pinpoint_notifier.dart';
import '../../state/reverse_geo/reverse_geo_notifier.dart';
import '../../state/reverse_geo/reverse_geo_request_state.dart';

class GeolocPinpointMapAlert extends ConsumerWidget {
  GeolocPinpointMapAlert({super.key, required this.geolocList, required this.distanceMap});

  final List<Geoloc> geolocList;

  final Map<String, String> distanceMap;

  int geolocListNum = 0;

  late CameraPosition initialCameraPosition;

  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  late Set<Marker> markers;

  final autoScrollController = AutoScrollController();

  Set<Polyline> polylineSet = {};

  LatLngBounds pinpointMapBounds = LatLngBounds(southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    geolocListNum = geolocList.length;

    setMapParam();

    makeBounds();

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
    makePolyline();

    ///
    final addressComponentsNameList = ref.watch(reverseGeoProvider.select((value) => value.addressComponentsNameList));

    ///
    final zoomNumbers = <int>[];
    for (var i = 12; i <= 19; i++) {
      zoomNumbers.add(i);
    }

    ///
    final zoomDropDown = DropdownButton(
      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
      iconEnabledColor: Colors.white,
      items: zoomNumbers.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e.toString(), style: const TextStyle(fontSize: 12)),
        );
      }).toList(),
      value: mapPinpointState.pinpointMapZoom,
      onChanged: (value) async => _ref.watch(mapPinpointProvider.notifier).setPinpointMapZoom(zoom: value!),
    );

    final distance = (distanceMap['${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}'] != null)
        ? '${distanceMap['${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}']} Km'
        : '';

    final pinpointSpotNum = ref.watch(appParamProvider.select((value) => value.pinpointSpotNum));

    final pinpointMapBoundsDisplay = ref.watch(appParamProvider.select((value) => value.pinpointMapBoundsDisplay));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //=======================================
                      Expanded(
                        child: GoogleMap(
                          onMapCreated: mapController.complete,
                          initialCameraPosition: initialCameraPosition,
                          markers: markers,
                          polylines: polylineSet,
                          zoomControlsEnabled: false,
                        ),
                      ),
                      //=======================================

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text((pinpointSpotNum + 1).toString()),
                                const Text(' / '),
                                Text(geolocListNum.toString()),
                              ],
                            ),
                            Switch(
                              value: pinpointMapBoundsDisplay,
                              onChanged: (value) {
                                ref.read(appParamProvider.notifier).setPinpointMapBoundsDisplay(value: value);

                                if (value) {
                                  _displayPinpointMapBounds();
                                } else {
                                  tapListTime(geoloc: geolocList[pinpointSpotNum]);
                                }
                              },
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    var ppsNum = pinpointSpotNum;
                                    ppsNum--;
                                    if (ppsNum < 0) {
                                      ppsNum = 0;
                                    }

                                    autoScrollController.scrollToIndex(ppsNum);

                                    setCurrentSpot(pos: ppsNum);
                                  },
                                  icon: const Icon(Icons.navigate_before),
                                ),
                                IconButton(
                                  onPressed: () {
                                    var ppsNum = pinpointSpotNum;
                                    ppsNum++;
                                    if (ppsNum >= geolocListNum) {
                                      ppsNum = geolocListNum;
                                    }

                                    autoScrollController.scrollToIndex(ppsNum);

                                    setCurrentSpot(pos: ppsNum);
                                  },
                                  icon: const Icon(Icons.navigate_next),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 5),
                                                Text(
                                                    '${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}'),
                                                Text(
                                                  '${mapPinpointState.pinpointLat} / ${mapPinpointState.pinpointLng}',
                                                  style: const TextStyle(fontSize: 10),
                                                ),
                                                if (distance != '')
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                                    child: Text(
                                                      distance,
                                                      style: const TextStyle(color: Colors.yellowAccent, fontSize: 12),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          zoomDropDown,
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          addressComponentsNameList.join(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(color: Colors.yellowAccent, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 60,
              child: Column(children: [const SizedBox(height: 20), Expanded(child: displayGeolocList())]),
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

    pinpointMapBounds = LatLngBounds(northeast: LatLng(maxLat, maxLng), southwest: LatLng(minLat, minLng));
  }

  ///
  Future<void> _displayPinpointMapBounds() async {
    final googleMap = await mapController.future;
    await googleMap.animateCamera(CameraUpdate.newLatLngBounds(pinpointMapBounds, 50));
  }

  ///
  Future<void> makePolyline() async {
    final poly = <LatLng>[];

    geolocList.forEach((element) => poly.add(LatLng(element.latitude.toDouble(), element.longitude.toDouble())));

    polylineSet.add(
      Polyline(
        polylineId: const PolylineId('overview_polyline'),
        color: Colors.redAccent,
        width: 5,
        points: poly,
      ),
    );
  }

  ///
  Widget displayGeolocList() {
    final list = <Widget>[];

    final pinpointTime = _ref.watch(mapPinpointProvider.select((value) => value.pinpointTime));

    for (var i = 0; i < geolocList.length; i++) {
      final exTime = geolocList[i].time.split(':');

      list.add(
        AutoScrollTag(
          key: ValueKey(i),
          index: i,
          controller: autoScrollController,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async => setCurrentSpot(pos: i),
                child: CircleAvatar(
                  backgroundColor:
                      (pinpointTime == geolocList[i].time) ? Colors.orangeAccent.withOpacity(0.6) : Colors.black,
                  child: Text('${exTime[0]}:${exTime[1]}', style: const TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(controller: autoScrollController, child: Column(children: list));
  }

  ///
  Future<void> setCurrentSpot({required int pos}) async {
    polylineSet.removeWhere((element) => element.polylineId == const PolylineId('overview_polyline2'));

    final pinpointSpotNum = _ref.watch(appParamProvider.select((value) => value.pinpointSpotNum));

    if (pos > 0) {
      if (pos > pinpointSpotNum) {
        final poly = <LatLng>[
          LatLng(geolocList[pos - 1].latitude.toDouble(), geolocList[pos - 1].longitude.toDouble()),
          LatLng(geolocList[pos].latitude.toDouble(), geolocList[pos].longitude.toDouble()),
        ];

        polylineSet.add(
          Polyline(
            polylineId: const PolylineId('overview_polyline2'),
            color: Colors.blueAccent,
            width: 5,
            points: poly,
          ),
        );
      }
    }

    await _ref.watch(mapPinpointProvider.notifier).setPinpointLatLng(
          date: geolocList[pos].date.yyyymmdd,
          time: geolocList[pos].time,
          lat: geolocList[pos].latitude.toDouble(),
          lng: geolocList[pos].longitude.toDouble(),
        );

    await _ref.watch(reverseGeoProvider.notifier).getReverseGeoState(
          param: ReverseGeoRequestState(latitude: geolocList[pos].latitude, longitude: geolocList[pos].longitude),
        );

    await _ref.read(appParamProvider.notifier).setPinpointSpotNum(value: pos);

    //--------------------//
    final pinpointMapBoundsDisplay = _ref.watch(appParamProvider.select((value) => value.pinpointMapBoundsDisplay));

    if (pinpointMapBoundsDisplay == false) {
      await tapListTime(geoloc: geolocList[pos]);
    }

    //--------------------//
  }

  ///
  void setMapParam() {
    final pinpointMapZoom = _ref.watch(mapPinpointProvider.select((value) => value.pinpointMapZoom));

    final latLng = LatLng(geolocList[0].latitude.toDouble(), geolocList[0].longitude.toDouble());
    initialCameraPosition = CameraPosition(target: latLng, zoom: pinpointMapZoom.toDouble(), tilt: 50);
  }

  ///
  Future<void> tapListTime({required Geoloc geoloc}) async {
    final pinpointMapZoom = _ref.watch(mapPinpointProvider.select((value) => value.pinpointMapZoom));

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

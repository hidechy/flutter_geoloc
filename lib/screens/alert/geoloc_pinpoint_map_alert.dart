// ignore_for_file: must_be_immutable, depend_on_referenced_packages, use_build_context_synchronously

import 'dart:async';

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

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    geolocListNum = geolocList.length;

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
    makePolyline();

    ///
    final addressComponentsNameList = ref.watch(reverseGeoProvider.select((value) => value.addressComponentsNameList));

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

    final distance = (distanceMap['${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}'] != null)
        ? '${distanceMap['${mapPinpointState.pinpointDate} ${mapPinpointState.pinpointTime}']} Km'
        : '';

    final pinpointSpotNum = ref.watch(appParamProvider.select((value) => value.pinpointSpotNum));

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
                                DefaultTextStyle(
                                  style: const TextStyle(fontSize: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${mapPinpointState.pinpointLat} / ${mapPinpointState.pinpointLng}'),
                                      Text(addressComponentsNameList.join()),
                                      if (distance != '')
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: Text(distance, style: const TextStyle(color: Colors.yellowAccent)),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            radiusDropDown,
                          ],
                        ),
                      ),
                    ],
                  ),

                  //=======================================
                  Expanded(
                    child: GoogleMap(
                      onMapCreated: mapController.complete,
                      initialCameraPosition: initialCameraPosition,
                      markers: markers,
                      polylines: polylineSet,
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
            ),
            SizedBox(
              width: 60,
              child: Column(children: [const SizedBox(height: 40), Expanded(child: displayGeolocList())]),
            ),
          ],
        ),
      ),
    );
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

    await tapListTime(geoloc: geolocList[pos]);
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

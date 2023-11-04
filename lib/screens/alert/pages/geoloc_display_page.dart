// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../extensions/extensions.dart';
import '../../../models/geoloc.dart';
import '../../../utility/utility.dart';
import '../../../view_model/geoloc_viewmodel.dart';
import '../geoloc_dialog.dart';
import '../geoloc_map_alert.dart';

class GeolocDisplayPage extends ConsumerWidget {
  GeolocDisplayPage({super.key, required this.date});

  final DateTime date;

  List<Geoloc> geolocList = [];

  Utility utility = Utility();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: context.screenSize.width),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(date.yyyymmdd),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          GeolocDialog(
                            context: context,
                            widget: GeolocMapAlert(geolocList: geolocList),
                          );
                        },
                        child: const Icon(Icons.map, color: Colors.greenAccent),
                      ),
                    ],
                  ),
                  Text(_getListNum()),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.5), thickness: 2),
              Expanded(child: displayGeoloc()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayGeoloc() {
    final list = <Widget>[];

    final geolocState = _ref.watch(geolocProvider(date));

    geolocList = geolocState;

    for (var i = 0; i < geolocState.length; i++) {
      var distance = '0.00';

      if (i < geolocState.length - 1) {
        try {
          distance = utility.calcDistance(
            originLat: geolocState[i + 1].latitude.toDouble(),
            originLng: geolocState[i + 1].longitude.toDouble(),
            destLat: geolocState[i].latitude.toDouble(),
            destLng: geolocState[i].longitude.toDouble(),
          );
          // ignore: avoid_catches_without_on_clauses
        } catch (e) {
          distance = '0.00';
        }
      }

      list.add(
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
          child: Table(
            children: [
              TableRow(
                children: [
                  Text(geolocState[i].time),
                  Text(geolocState[i].latitude),
                  Text(geolocState[i].longitude),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        alignment: Alignment.topRight,
                        child: Text(
                          geolocState[i].similarPercent,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        distance,
                        style: TextStyle(color: (distance == '0.00') ? Colors.grey.withOpacity(0.6) : Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  String _getListNum() {
    final geolocState = _ref.watch(geolocProvider(date));
    return geolocState.length.toString();
  }
}

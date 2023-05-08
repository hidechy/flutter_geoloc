// ignore_for_file: must_be_immutable, cascade_invocations

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/geoloc.dart';
import '../../view_model/geoloc_viewmodel.dart';
import 'geoloc_dialog.dart';
import 'geoloc_map_alert.dart';

class GeolocDisplayAlert extends ConsumerWidget {
  GeolocDisplayAlert({super.key, required this.date});

  final DateTime date;

  List<Geoloc> geolocList = [];

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
                  Text(date.yyyymmdd),
                  GestureDetector(
                    onTap: () {
                      GeolocDialog(
                        context: context,
                        widget: GeolocMapAlert(geolocList: geolocList),
                      );
                    },
                    child: const Icon(Icons.map),
                  ),
                ],
              ),
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 2,
              ),
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

    geolocState.forEach((element) {
      list.add(
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 12),
            child: Row(
              children: [
                Expanded(child: Text(element.time)),
                Expanded(child: Text(element.latitude)),
                Expanded(child: Text(element.longitude)),
              ],
            ),
          ),
        ),
      );
    });

    return SingleChildScrollView(
      child: Column(children: list),
    );
  }
}

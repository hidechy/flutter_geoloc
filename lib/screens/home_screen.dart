// ignore_for_file: must_be_immutable, avoid_catches_without_on_clauses, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geoloc/extensions/extensions.dart';
import 'package:geoloc/screens/alert/period_map_alert.dart';
import 'package:geoloc/utility/utility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:table_calendar/table_calendar.dart';

import '../state/geoloc/geoloc_notifier.dart';
import '../state/geoloc/geoloc_state.dart';
import '../state/period_lat_lng/period_lat_lng_notifier.dart';
import '../state/period_lat_lng/period_lat_lng_request_state.dart';
import 'alert/geoloc_dialog.dart';
import 'alert/geoloc_display_alert.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final loc.Location location = loc.Location();

  StreamSubscription<loc.LocationData>? locationSubscription;

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    //-----------------------------//
    requestPermission();

    const oneMinutes = 60000;

    location
      ..changeSettings(interval: oneMinutes * 5)
      ..enableBackgroundMode();
    //-----------------------------//

    final focusDayState = ref.watch(focusDayProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _utility.getBackGround(),
            Column(
              children: [
                ///////////// calendar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TableCalendar(
//                    eventLoader: getEventForDay,

                    ///
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(color: Colors.transparent),
                      selectedDecoration: BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle,
                      ),

                      ///
                      todayTextStyle: TextStyle(color: Color(0xFFFAFAFA)),
                      selectedTextStyle: TextStyle(color: Color(0xFFFAFAFA)),
                      rangeStartTextStyle: TextStyle(color: Color(0xFFFAFAFA)),
                      rangeEndTextStyle: TextStyle(color: Color(0xFFFAFAFA)),
                      disabledTextStyle: TextStyle(color: Colors.grey),
                      weekendTextStyle: TextStyle(color: Colors.white),

                      ///
                      markerDecoration: BoxDecoration(color: Colors.white),
                      rangeStartDecoration: BoxDecoration(color: Color(0xFF6699FF)),
                      rangeEndDecoration: BoxDecoration(color: Color(0xFF6699FF)),
                      holidayDecoration: BoxDecoration(
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Color(0xFF9FA8DA),
                          ),
                        ),
                      ),
                    ),

                    ///
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    firstDay: DateTime.utc(2020),
                    lastDay: DateTime.utc(2030, 12, 31),

                    focusedDay: focusDayState,

                    ///
                    selectedDayPredicate: (day) {
                      return isSameDay(ref.watch(blueBallProvider), day);
                    },

                    ///
                    onDaySelected: (selectedDay, focusedDay) {
                      onDayPressed(date: selectedDay);
                    },

                    ///
                    onPageChanged: (focusedDay) {
                      onPageMoved(date: focusedDay);
                    },
                  ),
                ),
                ///////////// calendar
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: context.screenSize.height * 0.55),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: getLocation,
                        child: const Icon(Icons.maps_ugc_sharp),
                      ),
                      GestureDetector(
                        onTap: listenLocation,
                        child: const Icon(Icons.play_arrow),
                      ),
                      GestureDetector(
                        onTap: _stopListening,
                        child: const Icon(Icons.stop),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _ref.watch(geolocPeriodProvider.notifier).getPeriodGeoloc(
                                param: PeriodLatLngRequestState(flag: 'month', date: focusDayState),
                              );

                          await GeolocDialog(
                            context: context,
                            widget: PeriodMapAlert(date: focusDayState),
                          );
                        },
                        icon: const Icon(Icons.map),
                      ),
                      Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> requestPermission() async {
    final status = await Permission.location.request();

    if (status.isGranted) {
      debugPrint('done');
    } else if (status.isDenied) {
      await requestPermission();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  ///
  Future<void> getLocation() async {
    try {
      final locationResult = await location.getLocation();

      await insertGeoloc(location: locationResult);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///
  Future<void> listenLocation() async {
    locationSubscription = location.onLocationChanged.handleError((onError) {
      locationSubscription?.cancel();
    }).listen((loc.LocationData currentLocation) async {
      await insertGeoloc(location: currentLocation);
    });
  }

  ///
  Future<void> insertGeoloc({required loc.LocationData location}) async {
    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm:ss');
    final currentTime = timeFormat.format(now);

    await _ref.watch(insertGeolocProvider.notifier).insertGeoloc(
          param: GeolocState(
            date: now,
            time: currentTime,
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString(),
          ),
        );
  }

  ///
  Future<void> _stopListening() async {
    await locationSubscription?.cancel();
  }

  ///
  void onDayPressed({required DateTime date}) {
    GeolocDialog(
      context: _context,
      widget: GeolocDisplayAlert(date: date),
    );
  }

  ///
  void onPageMoved({required DateTime date}) {
    _ref.watch(focusDayProvider.notifier).setDateTime(dateTime: date);
  }
}

////////////////////////////////////////////////////////////
final focusDayProvider = StateNotifierProvider.autoDispose<FocusDayStateNotifier, DateTime>((ref) {
  return FocusDayStateNotifier();
});

class FocusDayStateNotifier extends StateNotifier<DateTime> {
  FocusDayStateNotifier() : super(DateTime.now());

  ///
  Future<void> setDateTime({required DateTime dateTime}) async {
    state = dateTime;
  }
}

////////////////////////////////////////////////////////////
final blueBallProvider = StateNotifierProvider.autoDispose<BlueBallStateNotifier, DateTime>((ref) {
  return BlueBallStateNotifier();
});

class BlueBallStateNotifier extends StateNotifier<DateTime> {
  BlueBallStateNotifier() : super(DateTime.now());

  ///
  Future<void> setDateTime({required DateTime dateTime}) async {
    state = dateTime;
  }
}

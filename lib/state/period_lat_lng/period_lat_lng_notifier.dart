// ignore_for_file: avoid_dynamic_calls

import 'package:geoloc/extensions/extensions.dart';
import 'package:geoloc/models/lat_lng.dart';
import 'package:geoloc/state/period_lat_lng/period_lat_lng_request_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../utility/utility.dart';

////////////////////////////////////////////////
final geolocPeriodProvider = StateNotifierProvider.autoDispose<GeolocPeriodNotifier, List<LatLng>>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return GeolocPeriodNotifier([], client, utility);
});

class GeolocPeriodNotifier extends StateNotifier<List<LatLng>> {
  GeolocPeriodNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getPeriodGeoloc({required PeriodLatLngRequestState param}) async {
    await client.post(
      path: APIPath.getAllGeoloc,
      body: {'flag': param.flag, 'date': param.date!.yyyymmdd},
    ).then((value) {
      final list = <LatLng>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(
          LatLng(
            latitude: value['data'][i]['latitude'].toString(),
            longitude: value['data'][i]['longitude'].toString(),
          ),
        );
      }
      state = list;
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

////////////////////////////////////////////////

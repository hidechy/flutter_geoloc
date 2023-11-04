// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../data/http/path.dart';
import '../extensions/extensions.dart';
import '../models/geoloc.dart';
import '../utility/utility.dart';

////////////////////////////////////////////////
final geolocProvider = StateNotifierProvider.autoDispose.family<GeolocNotifier, List<Geoloc>, DateTime>((ref, date) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return GeolocNotifier([], client, utility)..getGeoloc(date: date);
});

class GeolocNotifier extends StateNotifier<List<Geoloc>> {
  GeolocNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> getGeoloc({required DateTime date}) async {
    await client.post(
      path: APIPath.getGeoloc,
      body: {'date': date.yyyymmdd},
    ).then((value) {
      final list = <Geoloc>[];

      for (var i = 0; i < value['data'].length.toString().toInt(); i++) {
        list.add(Geoloc.fromJson(value['data'][i] as Map<String, dynamic>));
      }

      state = list;
    });

    // .catchError((error, _) {
    //   utility.showError('予期せぬエラーが発生しました');
    // });
  }
}

////////////////////////////////////////////////

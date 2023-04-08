// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../utility/utility.dart';
import 'geoloc_state.dart';

////////////////////////////////////////////////
final insertGeolocProvider =
    StateNotifierProvider.autoDispose<InsertGeolocNotifier, int>((ref) {
  final client = ref.read(httpClientProvider);

  final utility = Utility();

  return InsertGeolocNotifier(0, client, utility);
});

class InsertGeolocNotifier extends StateNotifier<int> {
  InsertGeolocNotifier(super.state, this.client, this.utility);

  final HttpClient client;
  final Utility utility;

  ///
  Future<void> insertGeoloc({required GeolocState param}) async {
    final uploadData = <String, dynamic>{};
    uploadData['date'] = param.date!.yyyymmdd;
    uploadData['time'] = param.time;
    uploadData['latitude'] = param.latitude;
    uploadData['longitude'] = param.longitude;

    await client
        .post(path: APIPath.insertGeoloc, body: uploadData)
        .then((value) {})
        .catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}

////////////////////////////////////////////////

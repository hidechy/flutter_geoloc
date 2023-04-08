enum APIPath {
  insertGeoloc,
  getGeoloc,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.insertGeoloc:
        return 'insertGeoloc';
      case APIPath.getGeoloc:
        return 'getGeoloc';
    }
  }
}

enum APIPath {
  insertGeoloc,
  getGeoloc,
  getAllGeoloc,
}

extension APIPathExtension on APIPath {
  String? get value {
    switch (this) {
      case APIPath.insertGeoloc:
        return 'insertGeoloc';
      case APIPath.getGeoloc:
        return 'getGeoloc';
      case APIPath.getAllGeoloc:
        return 'getAllGeoloc';
    }
  }
}

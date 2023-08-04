class FirestoreImageCaches {
  final Map<String, String> imageURLCaches = {};

  Future<String?> getImageURL(String storagePath) async {
    return imageURLCaches[storagePath];
  }

  Future<void> saveImageURL(String storagePath, String imageURL) async {
    imageURLCaches[storagePath] = imageURL;
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pokedex/shared/caches/firestore_images.dart';
import 'package:flutter_pokedex/shared/extension/string_extension.dart';
import 'package:flutter_pokedex/shared/utils/image_utils.dart';
import 'package:get_it/get_it.dart';

class FireStorageImageWidget extends StatelessWidget {
  final String storagePath;
  final double? width;
  final double? height;
  final Color? color;

  const FireStorageImageWidget({
    super.key,
    required this.storagePath,
    this.width,
    this.height,
    this.color,
  });

  Future<String?> _getImageURL() async {
    var firestoreImageCaches = GetIt.instance<FirestoreImageCaches>();

    try {
      var cacheImageURL = await firestoreImageCaches.getImageURL(storagePath);
      if (cacheImageURL != null) {
        return cacheImageURL;
      }
      var storageRef = FirebaseStorage.instance.ref().child(storagePath);
      var imageURL = await storageRef.getDownloadURL();
      await firestoreImageCaches.saveImageURL(storagePath, imageURL);
      return imageURL;
    } catch (e) {
      debugPrint('Failed getting image URL: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getImageURL(),
      builder: (context, snapshot) {
        return ImageUtils.networkImage(
          imageURL: snapshot.data.orEmpty,
          width: width,
          height: height,
          color: color,
        );
      },
    );
  }
}

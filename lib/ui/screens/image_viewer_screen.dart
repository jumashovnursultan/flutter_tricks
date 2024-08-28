import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen(
      // this.images,
      {super.key,
      this.initialImage = 0});

  // final List<String> images;
  final int initialImage;

  @override
  Widget build(BuildContext context) {
    final images = [
      'https://avatars.mds.yandex.net/i?id=2d834a32d152ac8407e445fd9c2029a7_l-5084109-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=1959c01acf3f85391c3a51786b166ee7_l-4986689-images-thumbs&n=13'
    ];
    return Stack(
      children: [
        PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(images[index]),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.contained,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
        ),
        SafeArea(
          child: Container(
            height: kToolbarHeight,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 2, top: 3),
            child: BackButton(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

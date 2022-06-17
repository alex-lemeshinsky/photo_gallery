import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          DismissiblePage(
            onDismissed: () => Navigator.pop(context),
            child: Hero(
              tag: imageUrl,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(imageUrl),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: IconButton(
              onPressed: () async => await Share.share(imageUrl),
              icon: const Icon(
                Icons.share,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_galery/screens/photo_screen.dart';

class HomeScreenImage extends StatelessWidget {
  const HomeScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      errorWidget: (_, url, error) =>
          Image.asset("assets/image_placeholder.jpg"),
      imageBuilder: (context, imageProvider) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhotoScreen(imageUrl: imageUrl),
            ),
          ),
          child: Hero(
            tag: imageUrl,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

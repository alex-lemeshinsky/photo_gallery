import 'package:flutter/material.dart';
import 'package:photo_galery/images.dart';
import 'package:photo_galery/widgets/home_screen_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  int _displayedItemCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo galery")),
      body: SmartRefresher(
        enablePullUp: !(_displayedItemCount == images.length),
        enablePullDown: false,
        controller: _refreshController,
        onLoading: () async {
          setState(() {
            if (_displayedItemCount + 10 < images.length) {
              _displayedItemCount += 10;
            } else {
              _displayedItemCount = images.length;
              _refreshController.loadNoData();
            }
          });

          await Future.delayed(const Duration(seconds: 1));

          _refreshController.loadComplete();
        },
        child: CustomScrollView(
          cacheExtent: 9999, // this line prevents images from disappearing
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: _displayedItemCount,
                (_, index) => HomeScreenImage(imageUrl: images[index]),
              ),
            ),
            if (_displayedItemCount == images.length)
              const SliverToBoxAdapter(
                child: Text(
                  "end of story :(",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

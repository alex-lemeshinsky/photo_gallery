import 'package:flutter/material.dart';
import 'package:photo_galery/screens/home_screen.dart';

void main() {
  runApp(const PhotoGalary());
}

class PhotoGalary extends StatelessWidget {
  const PhotoGalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

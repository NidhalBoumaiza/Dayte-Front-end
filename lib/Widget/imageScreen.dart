import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImageScreen extends StatelessWidget {
  dynamic image;

  ImageScreen({required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          const double swipeThreshold = 20.0; // Adjust this threshold as needed
          if (details.primaryVelocity! < 0 ||
              details.primaryVelocity! > 0 &&
                  details.primaryVelocity!.abs() > swipeThreshold) {
            Get.back();
            // Perform the desired action for dragging from right to left
          }
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Image.memory(image, fit: BoxFit.cover, width: 1000.0),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ImageTitleComic extends StatelessWidget {
  ImageTitleComic({super.key, this.url});
  String? url;

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return Image.network(
        url!,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            // Đã tải xong
            return child;
          } else if (loadingProgress.expectedTotalBytes != null &&
              loadingProgress.expectedTotalBytes! > 0) {
            // Đang tải
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                value: loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1),
              ),
            );
          } else {
            // Xử lý lỗi
            throw Exception(
                'Failed to load image: ${loadingProgress.toString()}');
          }
        },
        errorBuilder: (context, error, stackTrace) {
          // print("errorBuilder: $error");
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      );
    } else {
      return Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/reading.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ));
    }
  }
}

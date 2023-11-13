// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/core/constants/constants.dart';

class ImageCustome extends StatelessWidget {
  ImageCustome({super.key, this.url});
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

class ImageCustome2 extends StatefulWidget {
  ImageCustome2(
      {super.key,
      this.url,
      this.backgroundColor,
      this.margin,
      this.border,
      this.borderRadius,
      this.height,
      this.width,
      this.onError});
  String? url;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;
  BoxBorder? border;
  Color? backgroundColor;
  double? width;
  double? height;
  void Function(String error)? onError;

  @override
  State<ImageCustome2> createState() => _ImageCustome2State();
}

class _ImageCustome2State extends State<ImageCustome2> {
  Status status = Status.loading;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        if (status != Status.error) {
          setState(() {
            status = Status.succesfull;
          });
        }
      },
    );
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              widget.url!,
            ),
            onError: (exception, stackTrace) {
              setState(() {
                status = Status.error;
              });
              if (widget.onError != null) {
                widget.onError!(exception.toString());
              }
            },
            fit: BoxFit.cover,
          ),
          borderRadius: widget.borderRadius,
          color: widget.backgroundColor,
          border: widget.border),
      child: Stack(
        children: [
          if (status == Status.loading) const LoadingWidget(),
          if (status == Status.error)
            const Center(
              child: Icon(
                Icons.bug_report,
                color: Colors.red,
              ),
            )
        ],
      ),
    );
  }
}

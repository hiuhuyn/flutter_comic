// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/widgets/loading_widget.dart';
import 'package:nettruyen/core/constants/constants.dart';

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
      this.fit,
      this.onError});
  String? url;
  EdgeInsetsGeometry? margin;
  BorderRadiusGeometry? borderRadius;
  BoxBorder? border;
  Color? backgroundColor;
  double? width;
  double? height;
  BoxFit? fit;
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
            fit: widget.fit,
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

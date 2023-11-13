import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}

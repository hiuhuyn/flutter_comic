import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

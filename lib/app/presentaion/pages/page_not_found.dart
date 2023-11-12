import 'package:flutter/material.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    print("Page not found init");
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "404",
            style: TextStyle(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Page Not Found",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutesName.kHomePage, (route) => false);
                },
                child: const Text(
                  "Go back home",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}

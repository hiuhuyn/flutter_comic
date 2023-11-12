import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_genre_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_home_page.dart';
import 'package:nettruyen/app/presentaion/pages/page_not_found.dart';
import 'package:nettruyen/app/presentaion/widgets/drawer_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _listWidget = const [ItemHomePage(), ItemGenrePage()];
  Widget? _widgetBody;
  @override
  void initState() {
    _widgetBody = _listWidget[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Nettruyen clone",
            style: TextStyle(
                color: Colors.amber[700], fontWeight: FontWeight.bold),
          ),
        ),
        drawer: DrawerHome(
          onChanged: (indexSelect) {
            setState(() {
              if (indexSelect >= _listWidget.length || indexSelect < 0) {
                _widgetBody = const PageNotFound();
              } else {
                _widgetBody = _listWidget[indexSelect];
              }
            });
          },
        ),
        body: _widgetBody,
      ),
    );
  }
}

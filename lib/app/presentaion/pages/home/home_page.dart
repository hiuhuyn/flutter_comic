import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_genre_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_home_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_newComic_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/item_topcomic_page.dart';
import 'package:nettruyen/app/presentaion/pages/page_not_found.dart';
import 'package:nettruyen/app/presentaion/widgets/drawer_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _listWidget = [
    ItemHomePage(key: UniqueKey()),
    ItemGenrePage(
      key: UniqueKey(),
    ),
    ItemNewComicPage(
      key: UniqueKey(),
    ),
    ItemTopComicPage(
      key: UniqueKey(),
    )
  ];
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
          actions: [
            IconButton(
                onPressed: () {
                  switch (_widgetBody.runtimeType) {
                    case ItemHomePage:
                      ItemHomePage.loadingData(context);
                      break;
                    case ItemGenrePage:
                      setState(() {
                        _widgetBody = ItemGenrePage(key: UniqueKey());
                      });
                      break;
                    case ItemNewComicPage:
                      setState(() {
                        _widgetBody = ItemNewComicPage(key: UniqueKey());
                      });
                      break;
                    case ItemTopComicPage:
                      setState(() {
                        _widgetBody = ItemTopComicPage(key: UniqueKey());
                      });
                      break;
                  }
                },
                icon: const Icon(Icons.restart_alt))
          ],
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

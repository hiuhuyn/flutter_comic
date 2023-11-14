import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/pages/genres/body_genre_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/body_home_page.dart';
import 'package:nettruyen/app/presentaion/pages/new_comic/body_newComic_page.dart';
import 'package:nettruyen/app/presentaion/pages/top_comic/body_topcomic_page.dart';
import 'package:nettruyen/app/presentaion/pages/page_not_found.dart';
import 'package:nettruyen/app/presentaion/widgets/drawer_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _listWidget = [
    BodyHomePage(key: UniqueKey()),
    BodyGenrePage(
      key: UniqueKey(),
    ),
    BodyNewComicPage(
      key: UniqueKey(),
    ),
    BodyTopComicPage(
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Nettruyen clone",
            style: TextStyle(
                color: Colors.amber[700], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  switch (_widgetBody.runtimeType) {
                    case BodyHomePage:
                      BodyHomePage.loadingData(context);
                      break;
                    case BodyGenrePage:
                      setState(() {
                        _widgetBody = BodyGenrePage(key: UniqueKey());
                      });
                      break;
                    case BodyNewComicPage:
                      setState(() {
                        _widgetBody = BodyNewComicPage(key: UniqueKey());
                      });
                      break;
                    case BodyTopComicPage:
                      setState(() {
                        _widgetBody = BodyTopComicPage(key: UniqueKey());
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

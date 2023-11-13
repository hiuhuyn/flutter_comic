import 'package:flutter/material.dart';
import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/presentaion/pages/chapter_page/chapter_comic_page.dart';
import 'package:nettruyen/app/presentaion/pages/comic_page/comic_page.dart';
import 'package:nettruyen/app/presentaion/pages/home/home_page.dart';
import 'package:nettruyen/app/presentaion/pages/page_not_found.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class CustomeRoute {
  static PageRoute generate(RouteSettings settings) {
    print("route: ${settings.name}");
    print("arguments: ${settings.arguments}");
    if (settings.name == RoutesName.kComicById) {
      try {
        String data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ComicPage(
                  comicId: data,
                ),
            settings: settings);
      } catch (e) {
        print("Error route: $settings");
      }
    }
    if (settings.name == RoutesName.kChapterById) {
      try {
        var data = settings.arguments as Map<String, dynamic>;
        ComicEntity? comic = data["comic"];
        ChapterEntity? chapter = data["chapter"];
        if (comic != null && chapter != null) {
          return MaterialPageRoute(
              builder: (context) =>
                  ChapterComicPage(comicId: comic, chapterId: chapter),
              settings: settings);
        }
      } catch (e) {
        print("Error route: $settings");
      }
    }

    if (settings.name == RoutesName.kHomePage) {
      return MaterialPageRoute(
          builder: (context) => const HomePage(), settings: settings);
    }

    return MaterialPageRoute(
        builder: (context) => const PageNotFound(), settings: settings);
  }
}

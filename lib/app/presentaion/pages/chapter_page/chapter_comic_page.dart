// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/comic.dart';

class ChapterComicPage extends StatefulWidget {
  ChapterComicPage({super.key, required this.comicId, required this.chapterId});
  ComicEntity comicId;
  ChapterEntity chapterId;

  @override
  State<ChapterComicPage> createState() => _ChapterComicPageState();
}

class _ChapterComicPageState extends State<ChapterComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.comicId}\n${widget.chapterId}"),
      ),
    );
  }
}

import 'package:nettruyen/app/domain/models/comic.dart';

abstract class ChapterEvent {}

class GetChapterEvent extends ChapterEvent {
  ComicEntity comic;
  GetChapterEvent(this.comic);
}

class GetContentChapterEvent extends ChapterEvent {
  int chapterId;
  ComicEntity comic;
  GetContentChapterEvent({required this.chapterId, required this.comic});
}

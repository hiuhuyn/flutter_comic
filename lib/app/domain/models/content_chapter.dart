// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/image_chapter.dart';

// ignore: must_be_immutable
class ContentChapterEntity {
  List<ChapterEntity>? chapters;
  List<ImageChapterEntity>? images;
  String? chapter_name;
  String? comic_name;
  ContentChapterEntity({
    this.chapters,
    this.images,
    this.chapter_name,
    this.comic_name,
  });

  ContentChapterEntity copyWith({
    List<ChapterEntity>? chapters,
    List<ImageChapterEntity>? images,
    String? chapter_name,
    String? comic_name,
  }) {
    return ContentChapterEntity(
      chapters: chapters ?? this.chapters,
      images: images ?? this.images,
      chapter_name: chapter_name ?? this.chapter_name,
      comic_name: comic_name ?? this.comic_name,
    );
  }

  @override
  String toString() {
    return 'ContentChapterEntity(chapters: $chapters, images: $images, chapter_name: $chapter_name, comic_name: $comic_name)';
  }
}

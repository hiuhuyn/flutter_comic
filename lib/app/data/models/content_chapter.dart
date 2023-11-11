import 'dart:convert';

import 'package:nettruyen/app/data/models/chapter.dart';
import 'package:nettruyen/app/data/models/image_chapter.dart';
import 'package:nettruyen/app/domain/models/content_chapter.dart';

class ContentChapterModel extends ContentChapterEntity {
  ContentChapterModel(
      {super.chapter_name, super.chapters, super.comic_name, super.images});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapters':
          chapters?.map((x) => ChapterModel.fromEntity(x).toMap()).toList(),
      'images':
          images?.map((x) => ImageChapterModel.fromEntity(x).toMap()).toList(),
      'chapter_name': chapter_name,
      'comic_name': comic_name,
    };
  }

  factory ContentChapterModel.fromMap(Map<String, dynamic> map) {
    return ContentChapterModel(
      chapters: map['chapters'] != null
          ? List<ChapterModel>.from(
              (map['chapters'] as List<dynamic>).map<ChapterModel?>(
                (x) => ChapterModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      images: map['images'] != null
          ? List<ImageChapterModel>.from(
              (map['images'] as List<dynamic>).map<ImageChapterModel?>(
                (x) => ImageChapterModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      chapter_name: map['chapter_name'],
      comic_name: map['comic_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentChapterModel.fromJson(String source) =>
      ContentChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

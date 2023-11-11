import 'dart:convert';

import 'package:nettruyen/app/domain/models/image_chapter.dart';

// ignore: must_be_immutable
class ImageChapterModel extends ImageChapterEntity {
  ImageChapterModel({super.backup_src, super.page, super.src});

  factory ImageChapterModel.fromEntity(ImageChapterEntity entity) {
    return ImageChapterModel(
        backup_src: entity.backup_src, page: entity.page, src: entity.src);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'src': src,
      'backup_src': backup_src,
    };
  }

  factory ImageChapterModel.fromMap(Map<String, dynamic> map) {
    return ImageChapterModel(
      page: map['page'],
      src: map['src'],
      backup_src: map['backup_src'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageChapterModel.fromJson(String source) =>
      ImageChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

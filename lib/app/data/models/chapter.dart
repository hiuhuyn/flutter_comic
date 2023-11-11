import 'dart:convert';

import 'package:nettruyen/app/domain/models/chapter.dart';

class ChapterModel extends ChapterEntity {
  ChapterModel({required super.id, required super.name});

  factory ChapterModel.fromEntity(ChapterEntity entity) {
    return ChapterModel(id: entity.id, name: entity.name);
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      id: map['id'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  factory ChapterModel.fromJson(String source) =>
      ChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

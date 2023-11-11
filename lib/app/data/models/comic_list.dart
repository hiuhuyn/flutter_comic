import 'dart:convert';

import 'package:nettruyen/app/data/models/comic.dart';
import 'package:nettruyen/app/domain/models/comic_list.dart';

class ComicListModel extends ComicListEntity {
  ComicListModel({super.comics, super.current_page, super.total_pages});

  factory ComicListModel.fromEntity(ComicListEntity entity) {
    return ComicListModel(
        comics: entity.comics,
        current_page: entity.current_page,
        total_pages: entity.total_pages);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comics': comics?.map((x) => ComicModel.fromEntity(x).toMap()).toList(),
      'total_pages': total_pages,
      'current_page': current_page,
    };
  }

  factory ComicListModel.fromMap(Map<String, dynamic> map) {
    return ComicListModel(
      comics: map['comics'] != null
          ? List<ComicModel>.from(
              (map['comics'] as List<dynamic>).map<ComicModel?>(
                (x) => ComicModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      total_pages: map['total_pages'],
      current_page: map['current_page'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicListModel.fromJson(String source) =>
      ComicListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

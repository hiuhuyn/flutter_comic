import 'dart:convert';

import 'package:nettruyen/app/data/models/chapter.dart';
import 'package:nettruyen/app/data/models/genre.dart';
import 'package:nettruyen/app/domain/models/comic.dart';
import 'package:nettruyen/app/domain/models/genre.dart';

// ignore: must_be_immutable
class ComicModel extends ComicEntity {
  ComicModel(
      {super.id,
      super.title,
      super.thumbnail,
      super.description,
      super.authors,
      super.status,
      // ignore: non_constant_identifier_names
      super.other_names,
      // ignore: non_constant_identifier_names
      super.total_views,
      super.followers,
      super.chapters,
      super.genres,
      super.is_trending,
      super.last_chapter,
      super.short_description,
      super.updated_at});

  factory ComicModel.fromEntity(ComicEntity entity) {
    return ComicModel(
        id: entity.id,
        title: entity.title,
        thumbnail: entity.thumbnail,
        description: entity.description,
        authors: entity.authors,
        status: entity.status,
        other_names: entity.other_names,
        total_views: entity.total_views,
        followers: entity.followers,
        chapters: entity.chapters,
        genres: entity.genres,
        is_trending: entity.is_trending,
        last_chapter: entity.last_chapter,
        short_description: entity.short_description,
        updated_at: entity.updated_at);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'description': description,
      'authors': authors,
      'status': status,
      'other_names': other_names,
      'total_views': total_views,
      'followers': followers,
      'is_trending': is_trending,
      'last_chapter': last_chapter != null
          ? ChapterModel.fromEntity(last_chapter!).toMap()
          : null,
      'short_description': short_description,
      'updated_at': updated_at,
      'chapters':
          chapters?.map((x) => ChapterModel.fromEntity(x).toMap()).toList(),
      'genres': genres?.map((x) => GenreModel.fromEntity(x).toMap()).toList(),
    };
  }

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    List<dynamic>? chapterListMap = map['chapters'];
    List<dynamic>? genresListMap = map['genres'];
    List<GenreEntity>? listGenres;
    try {
      listGenres = genresListMap?.map((e) => GenreModel.fromMap(e)).toList();
    } catch (e) {
      listGenres =
          genresListMap?.map((e) => GenreModel(name: e.toString())).toList();
    }

    String? authorMap;
    if (map['authors'] is List) {
      authorMap = List.from(map['authors']).toString();
      authorMap = authorMap.replaceAll('[', '');
      authorMap = authorMap.replaceAll(']', '');
    } else {
      authorMap = map["authors"];
    }
    ChapterModel? lastChapter;
    if (map['last_chapter'] != null) {
      lastChapter = ChapterModel.fromMap(map['last_chapter']);
    } else if (map['lastest_chapter'] != null) {
      lastChapter = ChapterModel.fromMap(map['lastest_chapter']);
    }
    return ComicModel(
      id: map["id"],
      title: map["title"],
      thumbnail: map['thumbnail'],
      description: map['description'],
      authors: authorMap,
      status: map['status'],
      other_names: map['other_names'] != null
          ? List<String>.from(map['other_names'])
          : null,
      total_views: map['total_views'].toString(),
      followers: map['followers'].toString(),
      is_trending: map['is_trending'],
      last_chapter: lastChapter,
      short_description: map['short_description'],
      updated_at: map['updated_at'],
      chapters: chapterListMap?.map((e) => ChapterModel.fromMap(e)).toList(),
      genres: listGenres,
    );
  }

  factory ComicModel.fromJson(String source) =>
      ComicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}

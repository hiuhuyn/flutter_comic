// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:nettruyen/app/domain/models/chapter.dart';
import 'package:nettruyen/app/domain/models/genre.dart';

// ignore: must_be_immutable
class ComicEntity extends Equatable {
  String? id;
  String? title;
  String? thumbnail;
  String? description;
  String? short_description;
  bool? is_trending = false;
  String? updated_at; //
  String? authors;
  String? status;
  List<String>? other_names;
  int? total_views;
  int? followers;
  List<ChapterEntity>? chapters;
  List<GenreEntity>? genres;
  ChapterEntity? last_chapter; //

  ComicEntity({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
    this.short_description,
    this.is_trending,
    this.updated_at,
    this.authors,
    this.status,
    this.other_names,
    this.total_views,
    this.followers,
    this.chapters,
    this.genres,
    this.last_chapter,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];

  ComicEntity copyWith({
    String? id,
    String? title,
    String? thumbnail,
    String? description,
    String? short_description,
    bool? is_trending,
    String? updated_at,
    String? authors,
    String? status,
    List<String>? other_names,
    int? total_views,
    int? followers,
    List<ChapterEntity>? chapters,
    List<GenreEntity>? genres,
    ChapterEntity? last_chapter,
  }) {
    return ComicEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      short_description: short_description ?? this.short_description,
      is_trending: is_trending ?? this.is_trending,
      updated_at: updated_at ?? this.updated_at,
      authors: authors ?? this.authors,
      status: status ?? this.status,
      other_names: other_names ?? this.other_names,
      total_views: total_views ?? this.total_views,
      followers: followers ?? this.followers,
      chapters: chapters ?? this.chapters,
      genres: genres ?? this.genres,
      last_chapter: last_chapter ?? this.last_chapter,
    );
  }

  @override
  bool get stringify => true;
}
